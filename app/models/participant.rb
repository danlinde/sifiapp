class Participant < ActiveRecord::Base
	belongs_to :event, dependent: :destroy
	validates :email, :presence => true
end
