class Event < ActiveRecord::Base

	has_many :participants
	accepts_nested_attributes_for :participants

	# def populate_participants(num_of_participants)
 #    	num_of_participants.times { participants.build }
 #  	end

	has_attached_file :image, styles: {:medium => "450x450>", thumb: '250x250>'},
  :default_url => "/images/missing.png"

	belongs_to :organizer

	after_create :send_confirmation_email

  def send_confirmation_email
    EventNotifier.confirmation_email(self).deliver!
  end

  # def send_participants_email
  #    self.participants.each do |p|
  #     ParticipantNotifier.confirmation_email(self, p).deliver!
  #    end 
  # end 

end
