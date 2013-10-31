class Participant < ActiveRecord::Base
	belongs_to :event, dependent: :destroy
	validates :email, :presence => true

  before_save :generate_token

  after_create :send_participants_email

  def generate_token
    self.token ||= SecureRandom.urlsafe_base64(32)
  end

  def send_participants_email
    ParticipantNotifier.confirmation_email(event, self).deliver!
  end 

end
