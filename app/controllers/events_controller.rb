class EventsController < ApplicationController
	before_filter :authenticate_organizer!, only: [:new, :create]
	
	def new
		@event = Event.new
	end 

	def create
		@event = Event.new(params[:event].permit(:name, :description, :deadline, :image, :organizer_id))

		if @event.save
			flash.notice = "You created an event"
			redirect_to event_path(@event)
		else
			render 'new'
		end
	end

	def show
		@event = Event.find(params[:id])
	end
end
