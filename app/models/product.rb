class Product < ApplicationRecord
  validates :name, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal: 0.01 } 
  validates :name, uniqueness: true
  validates :image_url, allow_blank: true, format: { 
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  belongs_to :seller, class_name: 'User'
  has_many :offers
  has_many :pledges, through: :offers
  has_many :buyers, through: :pledges
end
