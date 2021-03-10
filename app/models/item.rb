class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :states
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  belongs_to :user
  has_one_attached :image
  has_one :buyer

  with_options presence: true do
    validates :name
    validates :text
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :states_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :shipping_day_id
    end
    validates :price, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9_999_999 }
    validates :image
  end
end
