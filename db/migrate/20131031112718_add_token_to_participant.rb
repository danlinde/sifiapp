class AddTokenToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :token, :text
  end
end
