class DropSis < ActiveRecord::Migration
  def change
      drop_table :sis
  end
end
