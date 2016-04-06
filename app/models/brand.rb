class Brand < ActiveRecord::Base
    has_many :cloths, dependent: :destroy
end
