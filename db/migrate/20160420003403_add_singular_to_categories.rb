class AddSingularToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :singular, :string
  end
end
