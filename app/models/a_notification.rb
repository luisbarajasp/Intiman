class ANotification < ActiveRecord::Base
    belongs_to :admin
    belongs_to :order

    scope :unread, ->{where(read_at: nil)}
end
