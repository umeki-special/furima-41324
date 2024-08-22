class OrderForm
  include ActiveModel::Model

  attr_accessor :post_code, :prefecture_id, :city, :building, :address, :address2, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code
    validates :city
    validates :address
    validates :item_id
    validates :user_id
    validates :phone_number
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "must be selected" }

  def save
    history = History.create(item_id: item_id, user_id: user_id)
    Destination.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building: building,
      phone_number: phone_number,
      history_id: history.id
    )
  end
end
