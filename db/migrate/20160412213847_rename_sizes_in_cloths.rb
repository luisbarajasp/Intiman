class RenameSizesInCloths < ActiveRecord::Migration
  def change
      rename_column :cloths, :sizes, :sizes_n
  end
end
