class ParticipantsController < ApplicationController
	def edit
		@event = Event.find params[:event_id]
		@participant = Participant.find params[:id]
	end

	def update
		# render :text => params.inspect
		event = Event.find params[:event_id]
		participant = Participant.find_by_token(session[:participant_token])
		if participant.update(response: params[:response])
			flash.notice = "Your response has been updated"
			WebsocketRails[:responses].trigger 'new', participant
			if participant.response == "Yes" && event.amount
				redirect_to new_event_charge_path(event)
				# render json: { payment_needed: true }
			else
				redirect_to participant_token_path(event, participant.token)
			end
		else
			render 'edit'
		end
	end

	def show

	end
end
