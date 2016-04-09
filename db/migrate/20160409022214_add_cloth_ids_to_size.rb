class AddClothIdsToSize < ActiveRecord::Migration
  def change
      add_column :sizes, :cloth_ids, :integer, array: true, default: []
  end
end
