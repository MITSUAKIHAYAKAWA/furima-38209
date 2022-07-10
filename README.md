## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| nickname           | string | null: false               |
| birthday           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

## association

- has_many :products
- has_many :buys

## productsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| description        | text       | null: false                    |
| delivery_time_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| ship_form_id       | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |


## association

- belongs_to :user
- has_one :buys 

## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| postcode      | string     | null: false                    |
| phone_number  | string     | null: false                    |

## association

- belongs_to :buy

## buysテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ | 
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |
| address    | references | null: false, foreign_key: true |

## association

- belongs_to :user
- belongs_to :product
- has_one :address