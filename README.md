## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| user_birthday      | date    | null: false |

### Association

- has_many :animals
- has_many :orders

## animals テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| animal_name         | string     | null: false                    |
| current_location    | string     | null: false                    |
| animal_age          | integer    | null: false                    |
| type                | string     | null: false                    |
| male_female_id      | integer    | null: false                    |
| vaccine_id          | integer    | null: false                    |
| background          | text       | null: false                    |
| personality         | string     | null: false                    |
| health              | string     | null: false                    |
| transfer_method     | string     | null: false                    |

### Association

- belongs_to :user
- has_one   :order

## parents_info テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |


### Association

- belongs_to :order

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| animal        | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :animal
- has_one    :parents_info

