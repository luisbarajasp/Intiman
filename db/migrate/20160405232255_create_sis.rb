class CreateSis < ActiveRecord::Migration
  def change
    create_table :sis do |t|
      t.integer :size_id

      t.timestamps null: false
    end
  end
end
