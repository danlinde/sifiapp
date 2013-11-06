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
	end

	def show
		@event = Event.find params[:id]
		@token = params[:token]
		@participant = Participant.find_by_token(params[:token])

		@participants = @event.participants

		if @participant
			session[:participant_token] = params[:token]
		else
			flash[:notice] = 'Invalid token'
			redirect_to '/'
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
	end

	def destroy
		event = Event.find(params[:id]).destroy
		redirect_to root_path
	end

	private

  	def event_params
    params.require(:event).permit(:name, :description, :deadline, :event_date, :amount, :image, :organizer_id, :web_link,
          	:participant_emails)
  	end

end
