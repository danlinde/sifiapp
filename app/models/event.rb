class Event < ActiveRecord::Base

	has_many :participants
	accepts_nested_attributes_for :participants

	has_attached_file :image, styles: {thumb: '200x200>'}

	belongs_to :organizer

	after_create :send_confirmation_email

  validates :organizer, presence: true

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
