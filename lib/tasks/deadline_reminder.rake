task :deadline_reminder => :environment do
	Event.where(deadline_email_sent: false).to_a.each do |event|
		if event.send_deadline_email
			puts "Sending email for #{event.name}"
		end
	end
end