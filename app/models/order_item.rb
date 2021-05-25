class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  attribute :production_status, :integer, default: 0

  def status_name
    name = {0 => "着手不可", 1 => "制作待ち", 2 => "制作中", 3 =>"制作完了"}
    return name[self.production_status]
  end
end
