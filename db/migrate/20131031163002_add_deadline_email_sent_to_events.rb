class AddDeadlineEmailSentToEvents < ActiveRecord::Migration
  def change
    add_column :events, :deadline_email_sent, :boolean, default: false
  end
end
