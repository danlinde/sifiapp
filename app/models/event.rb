class Event < ActiveRecord::Base

	has_many :participants
	accepts_nested_attributes_for :participants

	# def populate_participants(num_of_participants)
 #    	num_of_participants.times { participants.build }
 #  	end

	has_attached_file :image, styles: {thumb: '200x200>'}

	belongs_to :organizer

	after_create :send_confirmation_email, :send_participants_email

  def send_confirmation_email
    EventNotifier.confirmation_email(self).deliver!
  end

  def send_participants_email
     self.participants.each do |p|
      ParticipantNotifier.confirmation_email(self, p).deliver!
     end 
  end 

  # def send_confirmation_email_participart
  # 	@event.participant.each do |f|
  # 		EventNotifier.confirmation_email.deliver!
  # 	end
  # end 

end
