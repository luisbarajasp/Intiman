class CreateProms < ActiveRecord::Migration
  def change
    create_table :proms do |t|
      t.integer :promotion_id
      t.integer :cloth_id

      t.timestamps null: false
    end
  end
end
