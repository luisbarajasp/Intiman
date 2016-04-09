class AddSizesToCloths < ActiveRecord::Migration
  def change
      add_column :cloths, :sizes, :integer, array: true, default: []
  end
end
