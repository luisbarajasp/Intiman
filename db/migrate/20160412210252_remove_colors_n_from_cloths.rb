class RemoveColorsNFromCloths < ActiveRecord::Migration
  def change
      remove_column :cloths, :colors_n
  end
end
