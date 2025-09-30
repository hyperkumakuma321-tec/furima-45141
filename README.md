# README

## users_table

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| mail               | string | null: false, unique: true |
| encrypted_password | string | null: false |
| firstname          | string | null: false |
| lastname           | string | null: false |
| kana_first_name    | string | null: false |
| kana_last_name     | string | null: false |
| birth              | string | null: false |
### Association

- has_many :items
- has_one  :buydatas, cards

## items_table

| Column             | Type   | Options     |
| img                | string | null: false |
| name               | string | null: false |
| explanation        | text   | null: false |
| category           | string | null: false |
| status             | string | null: false |
| haisou_futan       | string | null: false |
| hassou_area        | string | null: false |
| hassou_day         | string | null: false |
| price              | string | null: false |

- belongs_to :users
- has_one    :buydatas

## buydatas_table

| Column             | Type       | Options     |
| postnumber         | string     | null: false |
| todofuken          | string     | null: false |
| sikuchouson        | string     | null: false |
| banti              | string     | null: false |
| tatemono           | string     | null: false |
| tel                | string     | null: false |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

- has_one  :users, items

## cards_table
| Column             | Type       | Options     |
| customer_token     | string     | null: false |
| user               | references | null: false, foreign_key: true |

- has_one  :users
