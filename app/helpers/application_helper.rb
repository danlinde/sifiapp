module ApplicationHelper
	def format_link link
		if link =~ /https?/
			link
		else 
			'http://' + link
		end
	end
end
