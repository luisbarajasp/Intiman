class Order < ActiveRecord::Base
    belongs_to :order_status
    belongs_to :user
    has_many :order_items
    before_create :set_order_status
    before_save :update_values

    def subtotal
      order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
    end
    def calculate_shipping
    end
    def shipping
      order_items.collect { |oi| oi.valid? ? (oi.quantity * 50) : 0 }.sum
    end
    def total
      subtotal + shipping
    end
  private
    def set_order_status
      self.order_status_id = 1
    end

    def update_values
      self[:subtotal] = subtotal
      self[:shipping] = shipping
      self[:total] = total
    end
end
