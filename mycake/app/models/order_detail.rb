class OrderDetail < ApplicationRecord
  validates :price, presence: true
  validates :amount, presence: true
  enum making_status: {non:0, wait:1, now:2, ed:3}
  
  belongs_to :item
  belongs_to :order
  def sub_total
    price*amount
  end
end
