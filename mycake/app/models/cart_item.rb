class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :amount, presence: true
  
  def subtotal
    item.with_tax*amount
  end
end