class Cloth < ActiveRecord::Base
    belongs_to :admin
    belongs_to :brand
    belongs_to :category

    has_many :sis
    has_many :cos
    has_many :sizes, :through => :sis
    has_many :colors, :through => :cos

    has_attached_file :image1, styles: {medium: "600x", preview:"280x180", thumb: "100x100>" }, default_url: "pinterest-pin.png"
	validates_attachment_content_type :image1, content_type: %w(image/jpeg image/jpg image/png)

    has_attached_file :image2, styles: {medium: "600x", preview:"280x280", thumb: "100x100>" }, default_url: "pinterest-pin.png"
	validates_attachment_content_type :image2, content_type: %w(image/jpeg image/jpg image/png)
end
