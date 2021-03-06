FactoryBot.define do
  factory :item do
    name  { 'test' }
    text  { 'test  test' }
    category_id { '2' }
    states_id { '2' }
    delivery_fee_id { '2' }
    prefecture_id { '2' }
    shipping_day_id { '2' }
    price { '2000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
