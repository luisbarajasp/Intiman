class UNotification < ActiveRecord::Base
    belongs_to :user
    belongs_to :order

    scope :unread, ->{where(read_at: nil)}
    
end
