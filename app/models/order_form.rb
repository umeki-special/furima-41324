class OrderForm
  include ActiveModel::Model

  attr_accessor :post_code, :prefecture_id, :city, :address, :address2, :phone_number, :item_id, :user_id, :token

  # バリデーションの設定
  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
    validates :token
  end

  def save
    history = History.create(item_id: item_id, user_id: user_id)
    Destination.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      address2: address2,
      phone_number: phone_number,
      history_id: history.id
    )
  end
end
