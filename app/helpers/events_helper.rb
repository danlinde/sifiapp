module EventsHelper

	def nice_date(date)
		date.to_s(:long) if date
	end

	def iso8601_date(date)
		date.iso8601 if date
	end
end
