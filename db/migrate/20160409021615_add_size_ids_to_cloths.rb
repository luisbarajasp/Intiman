class AddSizeIdsToCloths < ActiveRecord::Migration
  def change
      add_column :cloths, :size_ids, :integer, array: true, default: []
  end
end
