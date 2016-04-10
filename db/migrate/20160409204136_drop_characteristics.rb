class DropCharacteristics < ActiveRecord::Migration
  def change
      drop_table :characteristics
  end
end
