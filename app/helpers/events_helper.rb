module EventsHelper

	def nice_date(date)
		date.to_s(:long) if date
	end

	def iso8601_date(date)
		date.iso8601 if date
	end

	def nice_price(amount)
		sprintf "£%.2f", amount
	end
end
