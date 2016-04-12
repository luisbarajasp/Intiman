class AddCategoryAndBrandToCloths < ActiveRecord::Migration
  def change
    add_column :cloths, :category_n, :string
    add_column :cloths, :brand_n, :string
  end
end
