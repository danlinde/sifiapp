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
	end

	private

  	def event_params
    params.require(:event)
          .permit(:name, :description, :deadline, :image,
          	participants_attributes: [:email, :first_name, :last_name])
  	end

end
