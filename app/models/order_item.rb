class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  attribute :production_status, :integer, default: 0
end
