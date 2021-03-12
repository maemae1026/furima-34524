FactoryBot.define do
  factory :buyer_residence do
    postal_code  { '111-1111' }
    prefecture_id  { 2 }
    city  { '横浜市緑区' }
    house_number  { '青山1-1-1' }
    phone_number  { '00099998888' }
  end
end