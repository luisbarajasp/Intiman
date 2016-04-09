class RemoveSaleFromCloths < ActiveRecord::Migration
  def change
    remove_column :cloths, :sale, :boolean
  end
end
