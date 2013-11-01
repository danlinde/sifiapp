class EventsController < ApplicationController
	before_filter :authenticate_organizer!, only: [:new, :create]
	
	def new
		@event = Event.new
		1.times {@event.participants.build}
	end 

	def create
		@event = Event.new(event_params)

		if @event.save
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
	end

	def edit
		@event = Event.find params[:id]
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
    params.require(:event).permit(:name, :description, :deadline, :event_date,:image, :organizer_id,
          	:participant_emails)
  	end

end
