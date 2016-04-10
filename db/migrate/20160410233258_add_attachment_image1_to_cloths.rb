class AddAttachmentImage1ToCloths < ActiveRecord::Migration
  def self.up
    change_table :cloths do |t|
      t.attachment :image1
    end
  end

  def self.down
    remove_attachment :cloths, :image1
  end
end
