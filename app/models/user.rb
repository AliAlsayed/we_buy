class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  #seller
  has_many :products, foreign_key: 'seller_id', dependent: :destroy
  has_many :offers, through: :products
  #buyer
  has_many :pledges, foreign_key: 'buyer_id', dependent: :destroy
  has_many :deals, through: :pledges, source: :offer
end
