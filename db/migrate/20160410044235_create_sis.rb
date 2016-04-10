class CreateSis < ActiveRecord::Migration
  def change
    create_table :sis do |t|
      t.integer :cloth_id
      t.integer :size_id

      t.timestamps null: false
    end
  end
end
