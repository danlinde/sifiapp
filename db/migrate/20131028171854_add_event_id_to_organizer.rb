class AddEventIdToOrganizer < ActiveRecord::Migration
  def change
    add_reference :organizers, :event, index: true
  end
end
