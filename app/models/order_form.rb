class OrderForm
  include ActiveModel::Model

  attr_accessor :post_code, :prefecture_id, :city, :building, :address, :address2, :phone_number, :item_id, :user_id, :token

  # バリデーションの設定
  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :address
    validates :token
  end
  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as 123-4567." }
  validates :phone_number, presence: true, numericality: { only_integer: true }, length: { in: 10..11 }, format: { with: /\A[0-9]+\z/, message: "is invalid. Input only number without hyphen." }


  def save
    history = History.create(item_id: item_id, user_id: user_id)
    Destination.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      address2: address2,
      building: building,
      phone_number: phone_number,
      history_id: history.id
    )
  end
end
