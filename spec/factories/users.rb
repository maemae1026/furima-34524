FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'00000a'}
    password_confirmation {password}
    family_name {'山田'}
    first_name {'太郎'}
    family_name_reading {'ヤマダ'}
    first_name_reading {'タロウ'}
    birth_day {'20000101'}
  end
end