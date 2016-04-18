class Category < ActiveRecord::Base
    has_many :cloths
    
    extend FriendlyId
    friendly_id :name, use: :slugged
end
