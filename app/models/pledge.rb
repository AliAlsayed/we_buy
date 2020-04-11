class Pledge < ApplicationRecord
  belongs_to :offer
  belongs_to :buyer, class_name: 'User'
end
