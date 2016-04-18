class AddScaleToDecimals < ActiveRecord::Migration
  def change
      change_column :cloths, :normal_price, :decimal, precision: 12, scale: 3
      change_column :cloths, :discount_price, :decimal, precision: 12, scale: 3
  end
end
