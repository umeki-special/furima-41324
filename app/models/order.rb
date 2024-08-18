class Order < ApplicationRecord
  attr_accessor :price, :token

  validates :price, presence: true
  validates :token, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end
