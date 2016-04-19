class OrderItem < ActiveRecord::Base
  belongs_to :cloth
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0, lesser_than: 11 }
  validate :cloth_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      cloth.price
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def cloth_present
    if cloth.nil?
      errors.add(:cloth, " es no válido o está inactivo. Por favor si tienes algún problema dirigete a Ayuda.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, " no es una orden válida. Por favor si tienes algún problema dirigete a Ayuda.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
