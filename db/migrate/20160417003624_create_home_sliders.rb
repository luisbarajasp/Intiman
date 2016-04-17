class CreateHomeSliders < ActiveRecord::Migration
  def change
    create_table :home_sliders do |t|
      t.text :description
      t.string :link

      t.timestamps null: false
    end
  end
end
