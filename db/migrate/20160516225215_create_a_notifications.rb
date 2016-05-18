class CreateANotifications < ActiveRecord::Migration
  def change
    create_table :a_notifications do |t|
      t.integer :admin_id
      t.datetime :read_at
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
