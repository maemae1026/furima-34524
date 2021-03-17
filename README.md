## usersテーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false |
| family_name         | string | null: false |
| first_name          | string | null: false |
| family_name_reading | string | null: false |
| first_name_reading  | string | null: false |
| birth_day           | date | null: false |

### Association
- has_many :items
- has_many :buyers
- has_many :comments

## itemsテーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| name            | string | null: false |
| text               | text | null: false |
| category_id  | integer | null: false |
| states_id         | integer | null: false |
| delivery_fee_id          | integer | null: false |
| prefecture_id | integer | null: false |
| shipping_day_id  | integer | null: false |
| price  | integer | null: false |
| user  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buyer
- has_many :comments

## buyersテーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
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
| prefecture_id  | integer | null: false |
| city  | string | null: false |
| house_number  | string | null: false |
| building_name  | string | |
| phone_number  | string | null: false |
| buyer  | references | null: false, foreign_key: true |

### Association
- belongs_to :buyer

## commentsテーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| text               | text | null: false |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item