class DropCos < ActiveRecord::Migration
  def change
      drop_table :cos
  end
end
