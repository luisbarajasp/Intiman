class Cloth < ActiveRecord::Base
    belongs_to :admin
    belongs_to :brand
    belongs_to :category

    has_many :cos
    has_many :images
    has_many :sis

end
