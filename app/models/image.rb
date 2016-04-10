class Image < ActiveRecord::Base
    belongs_to :cloth

    has_attached_file :img, styles: {medium: "600x", preview:"291x291^", thumb: "100x100>" }, default_url: "pinterest-pin.png"
	validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png)
end
