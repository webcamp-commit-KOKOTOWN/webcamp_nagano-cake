class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  attribute :postage, :integer, default: 800


  def total_price_calc
    customer = Customer.find(self.customer_id)
    carts = customer.cart_items.all
    total = 0
    carts.each do |cart|
      total += cart.item.tax_calc * cart.quantity
    end
    return total
  end

  def amount_calc
    amount = self.total_price_calc + self.postage
    return amount
  end

  def payment_option_name
    name = {true => "クレジットカード", false => "銀行振込"}
    return name[self.payment_option]
  end
end
