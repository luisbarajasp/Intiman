class Size < ActiveRecord::Base
    has_many :sis
    has_many :cloths, :through => :sis
end
