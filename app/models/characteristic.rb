class Characteristic < ActiveRecord::Base
    has_many :variants
    belongs_to :cloth
end
