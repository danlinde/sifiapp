class ParticipantNotifier < ActionMailer::Base
  default from: "no-reply@sifiapp.com"

helper :events

def confirmation_email(event, participant)
  	@event = event
	@participant = participant
	mail(to: @participant.email, subject: 'An Invitation')
  end 

end
