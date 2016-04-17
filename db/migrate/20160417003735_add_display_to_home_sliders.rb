class AddDisplayToHomeSliders < ActiveRecord::Migration
  def change
    add_column :home_sliders, :display, :boolean
  end
end
