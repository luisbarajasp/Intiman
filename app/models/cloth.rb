class Cloth < ActiveRecord::Base
    belongs_to :admin
    belongs_to :brand
    belongs_to :category

    has_many :variants, :through => :characteristics
    has_many :characteristics
    has_many :images
end
