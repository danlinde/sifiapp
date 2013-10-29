class EventNotifier < ActionMailer::Base
  default from: "no-reply@sifiapp.com"

  def confirmation_email(event)
  	@event = event
  	mail(to: 'someuser@example.com', subject: 'Event Confirmation')
  end
end
