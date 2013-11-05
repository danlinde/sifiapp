class AddStripePublishableKeyColumnToAuthentications < ActiveRecord::Migration
  def change
    add_column :authentications, :stripe_publishable_key, :string
  end
end
