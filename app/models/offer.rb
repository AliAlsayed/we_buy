class Offer < ApplicationRecord
  #validates :buyers_required, :amount_per_buyer, :discount, presence: true
  validates :buyers_required, :amount_per_buyer, 
  numericality: { greater_than_or_equal_to: 1 } 
  validates :discount, inclusion: 1..100
  validate :expiration_cannot_be_in_the_past
  belongs_to :product

  def expiration_cannot_be_in_the_past
    if expiration < Time.now
      errors.add(:expiration, "cant't be in the past")
    end
  end
end
