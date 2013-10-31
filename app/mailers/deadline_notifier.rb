class DeadlineNotifier < ActionMailer::Base
	default from: "no-reply@sifiapp.com"

	def deadline_email(event)
  		@event = event
  		if @event.organizer
			mail(to: @event.organizer.email, subject: 'Deadline is past')
		end
  	end
end
