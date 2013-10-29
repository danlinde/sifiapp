class AddEventIdToParticipants < ActiveRecord::Migration
  def change
    add_reference :participants, :event, index: true
  end
end
