class BuyerResidence
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :prefecture_id, :city, :house_number, :building_name, :phone_number, :price, :user_id

  # with_options presence: true do
  #   validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
  #   validates :user_id
  #   validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # end
  # validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    Buyer = Buyer.create(item_id: item.id, user_id: user.id)
    Residence.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end