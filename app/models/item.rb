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
    validates :category_id, numericality: { other_than: 1 }
    validates :states_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :shipping_day_id, numericality: { other_than: 1 }
    validates :price, format: { with: /\A[0-9]+\z/ } , inclusion: { in: 300..9999999 }
    validates :image
  end
end
