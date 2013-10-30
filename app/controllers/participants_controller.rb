class ParticipantsController < ApplicationController
	def edit
		@event = Event.find params[:event_id]
		@participant = Participant.find params[:id]
	end

	def update
		# render :text => params.inspect
		event = Event.find params[:event_id]
		participant = Participant.find params[:id]
		if participant.update(response: params[:response])
			flash.notice = "Your response has been updated"
			WebsocketRails[:responses].trigger 'new', participant
			redirect_to event
		else
			render 'edit'
		end
	end

	def show

	end
end
