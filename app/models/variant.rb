class Variant < ActiveRecord::Base
    has_many :cloths, :through => :characteristics
    belongs_to :characteristic
end
