class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :letter

      t.timestamps null: false
    end
  end
end
