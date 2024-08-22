class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/

  validates :nickname, presence: true, length: { maximum: 6 }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ヶ]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ヶ]+\z/ }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :email, uniqueness: true  # Ensure uniqueness validation is present

  has_many :items
  has_many :orders

end
