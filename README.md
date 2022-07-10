## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

## association

- has_many :addresses
- has_many :products
- has_many :buys

## productsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| product_name    | string     | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| description     | text       | null: false                    |
| delivery_time   | string     | null: false                    |
| price           | integer    | null: false                    |
| delivery_charge | string     | null: false                    |
| image           | string     | null: false                    |
| ship_form       | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |


## association

- belongs_to :user
- belongs_to :address
- has_one :buys 

## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| postcode      | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |


## association

- belongs_to :user
- has_many :products

## buysテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ | 
| user_id    | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |

## association

- belongs_to :user
- belongs_to :product