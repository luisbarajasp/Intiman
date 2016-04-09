class ChangeSaleTypeInCloths < ActiveRecord::Migration
  def change
      change_column :cloths, :sale, :boolean
  end
end
