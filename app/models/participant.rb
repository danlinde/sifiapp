class Participant < ActiveRecord::Base
	belongs_to :event, dependent: :destroy
	validates :email, :presence => true

  before_save :generate_token

  def generate_token
    self.token ||= SecureRandom.urlsafe_base64(32)
  end





  def send_invite_email
    ParticipantNotifier.confirmation_email(event, self).deliver!
  end 


end
