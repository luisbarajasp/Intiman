class Cloth < ActiveRecord::Base
    belongs_to :admin
    belongs_to :brand
    belongs_to :category

    has_many :sis
    has_many :cos
    has_many :sizes, :through => :sis
    has_many :colors, :through => :cos
    has_many :images
end
