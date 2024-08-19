class History < ApplicationRecord
  belongs_to :user
  has_one :destination
  belongs_to :item
  validates :item, :user, presence: true

end
