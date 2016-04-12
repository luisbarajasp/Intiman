class AddColorsToCloths < ActiveRecord::Migration
  def change
      add_column :cloths, :colors, :string, array: true, default: []
  end
end
