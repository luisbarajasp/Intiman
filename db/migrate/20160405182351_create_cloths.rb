class CreateCloths < ActiveRecord::Migration
  def change
    create_table :cloths do |t|
      t.text :description
      t.integer :normal_price
      t.integer :discount_price
      t.integer :sale

      t.timestamps null: false
    end
  end
end
