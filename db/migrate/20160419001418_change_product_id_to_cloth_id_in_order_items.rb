class ChangeProductIdToClothIdInOrderItems < ActiveRecord::Migration
  def change
      rename_column :order_items, :product_id, :cloth_id
  end
end
