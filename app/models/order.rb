class Order < ApplicationRecord
  belongs_to :offer
  belongs_to :buyer, class_name: 'User'

  def product
    offer.product
  end
end
