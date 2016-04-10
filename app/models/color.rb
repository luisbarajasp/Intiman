class Color < ActiveRecord::Base
    has_many :cos
    has_many :cloths, :through => :cos
end
