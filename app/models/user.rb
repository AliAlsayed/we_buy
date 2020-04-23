class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  #seller
  has_many :products, foreign_key: 'seller_id', dependent: :destroy
  has_many :offers, through: :products, dependent: :destroy
  #buyer
  has_many :pledges, foreign_key: 'buyer_id', dependent: :destroy
  has_many :deals, through: :pledges, source: :offer
  has_many :orders, foreign_key: 'buyer_id'
end
