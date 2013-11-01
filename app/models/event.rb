class Event < ActiveRecord::Base

	has_many :participants
	# accepts_nested_attributes_for :participants



	# def populate_participants(num_of_participants)
 #    	num_of_participants.times { participants.build }
 #  	end

	has_attached_file :image, styles: {:medium => "450x450>", thumb: '250x250>'},
  :default_url => "/images/missing.png"


	belongs_to :organizer

	after_create :send_confirmation_email, :send_participants_email

  validates :organizer, presence: true

  def participant_emails
  end

  def participant_emails=(comma_seperated_emails)
    emails = comma_seperated_emails.split(',')
    emails.map!(&:squish)

    emails.each do |email|
      participant = Participant.find_or_initialize_by_email(email)
      participant.event = self
      participant.save
    end
  end

  def send_participants_email
    participants.each do |participant|
      participant.send_invite_email
    end
  end

  def send_confirmation_email
    EventNotifier.confirmation_email(self).deliver!
  end

  def send_deadline_email
    return false if deadline.nil?

    if deadline < Time.now
      deadline_email_sent = true
      save
      DeadlineNotifier.deadline_email(self).deliver!
      return true
    end
  end

  def self.send_all_events_past_deadline
    Event.where(deadline_email_sent: false).all.each do |event|
      event.send_deadline_email
    end
  end
end
