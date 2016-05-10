class AddSoldAtToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :sold_at, :datetime
  end
end
