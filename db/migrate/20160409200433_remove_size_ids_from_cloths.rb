class RemoveSizeIdsFromCloths < ActiveRecord::Migration
  def change
      remove_column :cloths, :size_ids, :integer, array: true, default: []
  end
end
