class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :title
      t.boolean :show, :default => false

      t.timestamps null: false
    end
  end
end
