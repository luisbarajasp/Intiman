class AddAttachmentImage2ToCloths < ActiveRecord::Migration
  def self.up
    change_table :cloths do |t|
      t.attachment :image2
    end
  end

  def self.down
    remove_attachment :cloths, :image2
  end
end
