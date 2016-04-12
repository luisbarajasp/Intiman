class AddColorsNToCloths < ActiveRecord::Migration
  def change
      add_column :cloths, :colors_n, :string, array: true, default: []
  end
end
