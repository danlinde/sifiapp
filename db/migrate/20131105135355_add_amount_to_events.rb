class AddAmountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :amount, :decimal, :precision => 9, :scale => 2
  end
end
