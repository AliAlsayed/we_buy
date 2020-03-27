class Product < ApplicationRecord
  validates :name, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal: 0.01 } 
  validates :name, uniqueness: true
  validates :image_url, allow_blank: true, format: { 
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  has_many :offers
end
