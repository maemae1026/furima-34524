class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :states
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_day

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
