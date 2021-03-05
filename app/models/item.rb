class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :states_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price
    #validates :user, foreign_key: true
  end
end
