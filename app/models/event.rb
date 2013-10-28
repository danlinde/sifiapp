class Event < ActiveRecord::Base
	has_attached_file :image, styles: {thumb: '200x200>'}

	belongs_to :organizer
end
