class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  attribute :production_status, :integer, default: 0

  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :production_status, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

  def status_name
    name = {0 => "着手不可", 1 => "制作待ち", 2 => "制作中", 3 =>"制作完了"}
    return name[self.production_status]
  end
end
