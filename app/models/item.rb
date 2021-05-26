class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :genre

  attachment :image
  
  validates :genre_id, :name, :price, presence: true
	validates :description, length: {maximum: 200}
	validates :price, numericality: { only_integer: true }
end
