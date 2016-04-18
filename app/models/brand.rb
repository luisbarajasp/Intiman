class Brand < ActiveRecord::Base
    has_many :cloths, dependent: :destroy

    extend FriendlyId
    friendly_id :name, use: :slugged
end
