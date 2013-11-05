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
			if participant.response == "Yes"
				redirect_to new_event_charge_path(event)
			else redirect_to event
			end
		else
			render 'edit'
		end
	end

	def show

	end
end
