class RemoveEmailIndexFromOrganizers < ActiveRecord::Migration
  def change
  	remove_index :organizers, :email
  end
end
