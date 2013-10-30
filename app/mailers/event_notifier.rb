class EventNotifier < ActionMailer::Base
  default from: "no-reply@sifiapp.com"

  def confirmation_email(event)
  	@event = event
  	mail(to: 'haley.xt.wright@gmail.com', subject: 'Event Confirmation')
  end
end
