class DropVariants < ActiveRecord::Migration
  def change
      drop_table :variants
  end
end
