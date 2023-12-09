class Address < ApplicationRecord
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :name, presence: true
  
  belongs_to :customer
  def set
    '〒'+postal_code+' '+address+" "+name
  end
end
