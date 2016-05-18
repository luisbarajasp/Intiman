class AddMessageToUNotifications < ActiveRecord::Migration
  def change
    add_column :u_notifications, :message, :string
  end
end
