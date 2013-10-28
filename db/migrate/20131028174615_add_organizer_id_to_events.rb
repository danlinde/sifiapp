class AddOrganizerIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :organizer_id, :integer
  end
end
