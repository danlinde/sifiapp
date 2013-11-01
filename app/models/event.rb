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

  validates :organizer, presence: true

  validate :deadline_is_in_the_future

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

  def deadline_is_in_the_future
    if deadline < Time.now
      errors.add(:deadline, 'cannot be set for a time in the past')
    end
  end

end
