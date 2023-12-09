class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  validates :name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :shipping_cost, presence: true
  validates :total_payment, presence: true
  
  enum payment_method: {credit_card:0, transfer: 1}
  enum status: {wait:0, confirmed:1, making:2, ready:3, sent:4}
  
  def set
    '〒'+postal_code+' '+address+" "+name
  end
end
