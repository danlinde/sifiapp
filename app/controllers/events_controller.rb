class EventsController < ApplicationController
	before_filter :authenticate_organizer!, only: [:new, :create]
	
	def new
		@event = Event.new
	end 

	def create
		@event = Event.new(event_params)

		if @event.save!
			flash.notice = "You created an event"
			redirect_to event_path(@event)
		else
			render 'new'
		end

	rescue AWS::S3::Errors::RequestTimeout
 		flash[:notice] = "Upload timed out"
 		redirect_to 'new'
	end

	def show
		@event = Event.find params[:id]
		@token = params[:token]
		@participants = @event.participants
		@participant = @participants.find_by_token(params[:token])

		if @participant
			session[:participant_token] = params[:token]
		else
			unless @event.organizer == current_organizer
				flash[:notice] = 'Invalid token'
				redirect_to '/'
			end
		end
	end

	def edit
		@event = Event.find params[:id]
		@edit = true
	end

	def update
		@event = Event.find params[:id]
		if @event.update(event_params)
			redirect_to @event
		else
			render 'edit'
		end
	
	rescue AWS::S3::Errors::RequestTimeout
 		flash[:notice] = "Upload timed out"
 		redirect_to 'new'
	end

	def destroy
		event = Event.find(params[:id]).destroy
		redirect_to root_path
	end

	private

  	def event_params
    params.require(:event).permit(:name, :description, :deadline, :event_date, :amount, :image, :organizer_id, :link,
          	:participant_emails)
  	end

end
