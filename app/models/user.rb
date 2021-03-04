class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nickname
  validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
  validates :family_name_reading, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day
  validates :password, format: { with: /\A(?=.*[0-9])(?=.*[a-z])[0-9a-z]+\z/ }
  end
end
