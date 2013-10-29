class AddResponseToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :response, :string
  end
end
