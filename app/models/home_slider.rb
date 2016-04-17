class HomeSlider < ActiveRecord::Base
    has_attached_file :image, styles: {big: "1920x1080", medium: "768x432", preview:"512x288", thumb: "128x72" }, default_url: "pinterest-pin.png"
	validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png)
end
