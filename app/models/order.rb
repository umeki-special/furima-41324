# app/models/order.rb
class Order < ApplicationRecord
  has_one :history

  validates :price, :item, :user, presence: true
end
