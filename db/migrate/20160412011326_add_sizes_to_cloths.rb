class AddSizesToCloths < ActiveRecord::Migration
  def change
      add_column :cloths, :sizes, :string, array: true, default: []
  end
end
