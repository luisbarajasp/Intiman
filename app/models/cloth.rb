class Cloth < ActiveRecord::Base
    belongs_to :brand
    belongs_to :category

    has_many :sis, dependent: :destroy
    has_many :cos, dependent: :destroy
    has_many :proms, dependent: :destroy
    has_many :sizes, :through => :sis
    has_many :colors, :through => :cos
    has_many :promotions, :through => :proms


    has_attached_file :image1, styles: {large: "1200x", medium: "600x", preview:"210x135", thumb: "100x" }, default_url: "pinterest-pin.png"
	validates_attachment_content_type :image1, content_type: %w(image/jpeg image/jpg image/png)

    has_attached_file :image2, styles: {large: "1200x", medium: "600x", preview:"210x285", thumb: "100x" }, default_url: "pinterest-pin.png"
	validates_attachment_content_type :image2, content_type: %w(image/jpeg image/jpg image/png)

    acts_as_votable

    before_save :set_price
    def set_price
        if self.discount_price > 0
            self[:price] = self.discount_price
        else
            self[:price] = self.normal_price
        end
    end
end
