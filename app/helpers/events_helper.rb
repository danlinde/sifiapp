module EventsHelper

	def nice_date(date)
		date.to_s(:long) if date
	end

end
