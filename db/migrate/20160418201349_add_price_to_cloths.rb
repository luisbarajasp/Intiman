class AddPriceToCloths < ActiveRecord::Migration
  def change
      add_column :cloths, :price, :decimal, precision: 12, scale: 3 
  end
end
