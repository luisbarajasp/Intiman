class AddMessageToANotifications < ActiveRecord::Migration
  def change
    add_column :a_notifications, :message, :string
  end
end
