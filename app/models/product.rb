class Product < ApplicationRecord
  validates :name, :description, :main_image, presence: true
  validates :price, numericality: { greater_than_or_equal: 0.01 } 
  validates :name, uniqueness: true
  
  belongs_to :seller, class_name: 'User'
  has_many :offers, dependent: :destroy
  has_many :pledges, through: :offers, dependent: :destroy
  has_many :buyers, through: :pledges

  has_one_attached :main_image
  validate :acceptable_image

  private
    def acceptable_image

      return unless main_image.attached?
        
      unless main_image.blob.byte_size <= 1.megabyte
        errors.add(:main_image, "is too big")
      end

      acceptable_types = ['image/jpeg', 'image/png', 'image/jpg']
      unless acceptable_types.include?(main_image.content_type)
        errors.add(:main_image, "must be jpeg, png or jpg")
      end
    end
end
