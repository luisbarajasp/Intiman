class AddAddressToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :address, :string
    add_column :orders, :suburb, :string
    add_column :orders, :cp, :string
    add_column :orders, :city, :string
    add_column :orders, :state, :string
  end
end
