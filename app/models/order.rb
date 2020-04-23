class Order < ApplicationRecord
  belongs_to :offer
  belongs_to :buyer
end
