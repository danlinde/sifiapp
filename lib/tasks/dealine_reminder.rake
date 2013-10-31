task :deadline_reminder => :environment do
	Event.where(deadline_email_sent: false).all.each do |event|
		if event.send_deadline_email
			puts "Sending email for #{event.name}"
		end
	end
end