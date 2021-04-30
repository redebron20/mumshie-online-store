class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :product

     # LOGIC
  def total_price
    self.quantity * self.product.price
  end
end

