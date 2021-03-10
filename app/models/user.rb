class User < ApplicationRecord
  has_many :items
  has_many :buyers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/ } do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :family_name_reading
      validates :first_name_reading
    end
    validates :birth_day
    validates :password, format: { with: /\A(?=.*[0-9])(?=.*[a-z])[0-9a-z]+\z/ }
  end
end
