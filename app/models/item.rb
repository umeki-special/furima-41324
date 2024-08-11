class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :region_of_origin
  belongs_to_active_hash :estimated_shipping_date
  has_one_attached :image


end