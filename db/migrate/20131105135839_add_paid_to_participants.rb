class AddPaidToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :paid, :boolean, :default => false
  end
end
