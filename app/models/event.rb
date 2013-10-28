class Event < ActiveRecord::Base

	has_many :participants
	accepts_nested_attributes_for :participants

	# def populate_participants(num_of_participants)
 #    	num_of_participants.times { participants.build }
 #  	end

	has_attached_file :image, styles: {thumb: '200x200>'}

	belongs_to :organizer
end
