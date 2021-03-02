## usersテーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| encrypted_password  | string | null: false |
| family_name         | string | null: false |
| first_name          | string | null: false |
| family_name_reading | string | null: false |
| first_name_reading  | string | null: false |
| birth_day           | string | null: false |

### Association
- has_many :items
- has_one :buyer

## itemsテーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| name            | string | null: false |
| text               | text | null: false |
| category  | integer | null: false |
| states         | integer | null: false |
| delivery_fee          | integer | null: false |
| shipping_area | integer | null: false |
| shipping_day  | integer | null: false |
| price  | integer | null: false |
| price_fee  | integer | null: false |
| price_profit  | integer | null: false |
| user  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buyer

## buyersテーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| card_information  | integer | null: false |
| card_security  | integer | null: false |
| card_expiration_date  | integer | null: false |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :residence

## residencesテーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| postal_code  | string | null: false |
| prefecture  | integer | null: false |
| city  | string | null: false |
| house_number  | string | null: false |
| building_name  | string | null: false |
| phone_number  | integer | null: false |
| buyer  | references | null: false, foreign_key: true |

### Association
- belongs_to :buyer