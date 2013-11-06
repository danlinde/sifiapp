module ApplicationHelper
	def format_link link
		if link =~ /https?/
			link
		elsif link.nil?
			""
		else 
			'http://' + link
		end
	end
end
