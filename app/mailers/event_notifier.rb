class EventNotifier < ActionMailer::Base
  default from: "no-reply@sifiapp.com"

  def confirmation_email(event)
  	@event = event
  	if @event.organizer
		mail(to: @event.organizer.email, subject: 'Event Confirmation')
	end
  end
end
