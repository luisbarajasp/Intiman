class CreateCos < ActiveRecord::Migration
  def change
    create_table :cos do |t|
      t.integer :cloth_id
      t.integer :color_id

      t.timestamps null: false
    end
  end
end
