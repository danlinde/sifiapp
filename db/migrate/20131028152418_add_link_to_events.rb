class AddLinkToEvents < ActiveRecord::Migration
  def change
    add_column :events, :link, :text
  end
end
