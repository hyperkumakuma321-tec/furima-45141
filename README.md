# README

## users_table

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| kana_first_name    | string | null: false |
| kana_last_name     | string | null: false |
| birth              | date   | null: false |
### Association

- has_many :items
- has_many :buys

## items_table

| Column             | Type       | Options     |
| name               | string     | null: false |
| explanation        | text       | null: false |
| category_id        | integer    | null: false |
| status_id          | integer    | null: false |
| shipping_fee_id    | integer    | null: false |
| prefecture_id      | integer    | null: false |
| shipping_day_id    | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :buy

## buys_table
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
- has_one  :shipping_destination
- belongs_to :user
- belongs_to :item

## shipping_destinations_table

| Column             | Type       | Options     |
| postnumber         | string     | null: false |
| prefecture_id      | integer    | null: false |
| municipality       | string     | null: false |
| street_address     | string     | null: false |
| building           | string     |             |
| tel                | string     | null: false |
| buy                | references | null: false, foreign_key: true |

- belongs_to :buy

