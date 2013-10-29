class Organizer < ActiveRecord::Base
  
  has_many :authentications

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, dependent: :destroy

  def apply_omniauth(omni)
  	authentications.build(:provider => omni['provider'],
  	:uid => omni['uid'],
  	:token => omni['credentials'].token,
  	:token_secret => omni['credentials'].secret)
  end

  def password_required?
  	(authentications.empty? || !password.blank?) && super
  end

  def update_with_password(params, *options)
  	if encrypted_password.blank?
  		update_attributes(params, *options)
  	else
  		super
  	end
  end

  def email_required?
    super && authentications.empty?
  end

end
