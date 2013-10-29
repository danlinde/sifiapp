class EventNotifier < ActionMailer::Base
  default from: "no-reply@sifiapp.com"

  def confirmation_email
  	mail(to: 'someuser@example.com', subject 'Event confirmation')
  end
end
