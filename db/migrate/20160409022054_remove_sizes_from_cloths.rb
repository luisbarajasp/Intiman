class RemoveSizesFromCloths < ActiveRecord::Migration
  def change
      remove_column :cloths, :sizes, :integer, array: true, default: []
  end
end
