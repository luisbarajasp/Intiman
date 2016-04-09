class AddDefaultValueToSale < ActiveRecord::Migration
  def change
       change_column :cloths, :sale, :boolean, :default => false
  end
end
