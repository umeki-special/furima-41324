class Destination < ApplicationRecord
  belongs_to :history
  validates :post_code, :prefecture_id, :city, :address, :phone_number, presence: true

end
