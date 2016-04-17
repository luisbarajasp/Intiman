class AddAttachmentImageToHomeSliders < ActiveRecord::Migration
  def self.up
    change_table :home_sliders do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :home_sliders, :image
  end
end
