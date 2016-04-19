class AddColorIdAndSizeIdToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :color_id, :integer
    add_column :order_items, :size_id, :integer
  end
end
