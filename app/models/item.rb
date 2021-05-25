class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  attachment :image
  
  validates :genre_id, :name, :price, presence: true
	validates :description, length: {maximum: 200}
	validates :price, numericality: { only_integer: true }

  def tax_calc
    tax_rate = 0.1
    price_tax = self.price * tax_rate
    price_tax = self.price + price_tax.round
    return price_tax
  end
end
