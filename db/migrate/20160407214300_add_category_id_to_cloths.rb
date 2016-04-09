class AddCategoryIdToCloths < ActiveRecord::Migration
  def change
    add_column :cloths, :category_id, :integer
  end
end
