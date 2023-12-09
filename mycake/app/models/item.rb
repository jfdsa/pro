class Item < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: [true, false]
  
  
  has_one_attached :image
  validates :image, presence: true
  
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  def with_tax
    (price*1.1).floor
  end
end
