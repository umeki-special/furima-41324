class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :region_of_origin
  belongs_to_active_hash :estimated_shipping_date
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 40 }
  validates :description_of_item, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id, numericality: { other_than: 1 , message: "can't be '---'" }
  validates :status_id, numericality: { other_than: 1 , message: "can't be '---'" }
  validates :shipping_method_id, numericality: { other_than: 1 , message: "can't be '---'" }
  validates :region_of_origin_id, numericality: { other_than: 1 , message: "can't be '---'" }
  validates :estimated_shipping_date_id, numericality: { other_than: 1 , message: "can't be '---'" }
  validates :image, presence: { message: "No image attached. Please select an image" }
end