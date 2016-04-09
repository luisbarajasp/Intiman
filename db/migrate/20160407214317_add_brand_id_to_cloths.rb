class AddBrandIdToCloths < ActiveRecord::Migration
  def change
    add_column :cloths, :brand_id, :integer
  end
end
