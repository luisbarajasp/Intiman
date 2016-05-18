class CreateUNotifications < ActiveRecord::Migration
  def change
    create_table :u_notifications do |t|
      t.integer :user_id
      t.datetime :read_at
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
