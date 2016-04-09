class AddDefaultValueToDiscountPrice < ActiveRecord::Migration
  def change
      change_column :cloths, :discount_price, :integer, :default => 0
  end
end
