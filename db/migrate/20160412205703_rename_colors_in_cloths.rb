class RenameColorsInCloths < ActiveRecord::Migration
  def change
      rename_column :cloths, :colors, :colors_n
  end
end
