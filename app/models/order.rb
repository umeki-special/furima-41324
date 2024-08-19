# app/models/order.rb
class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :history

  validates :price, :item, :user, presence: true
end
