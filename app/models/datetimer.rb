class Datetimer < ActiveRecord::Base

	def datetime_format
		self.try(:to_s, :long) || "" 
	end

end
