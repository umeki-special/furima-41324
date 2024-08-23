class OrderForm
  include ActiveModel::Model

  attr_accessor :post_code, :prefecture_id, :city, :building, :address, :address2, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as 123-4567." }
    validates :city
    validates :address
    validates :item_id
    validates :user_id
    validates :phone_number, numericality: { only_integer: true }, length: { in: 10..11 }, format: { with: /\A[0-9]+\z/, message: "is invalid. Input only number without hyphen." }
    validates :token, format: { with: /\Atok_[0-9a-zA-Z]{24,}\z/, message: "is invalid" }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "must be selected" }

  def save
    history = History.create(item_id: item_id, user_id: user_id)
    if history.persisted?
      # Destination の作成を削除
      true
    else
      Rails.logger.error("Failed to create History record: #{history.errors.full_messages.join(', ')}")
      false
    end
  end
end
