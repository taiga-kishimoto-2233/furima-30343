# README

# テーブル設計

### users テーブル

| Columname             | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last_name_f           | string | null: false               |
| first_name_f          | string | null: false               |
| birthday              | date   | null: false               |

### Association

- has_many : items
- has_many : purchases


### items テーブル

| Columname   | Type          | Options           |
| ----------- | ------------- | ----------------- |
| name   　　　| string        | null: false       |
| text        | text          | null: false       |
| category_id | integer       | null: false       |
| states_id   | integer       | null: false       |
| charge_id   | integer       | null: false       |
| area_id     | integer       | null: false       |
| date_id     | integer       | null: false       |
| price       | integer       | null: false       |
| user        | references    | foreign_key: true |

### Association

- has_one : purchase
- belongs_to : user


### addresses テーブル

| Columname     | Type         | Options           |
| ------------- | ------------ | ----------------- |
| postal_code   | string       | null: false       |
| area_id       | integer      | null: false       |
| municipality  | string       | null: false       |
| address       | string       | null: false       |
| building      | string       |                   |
| phone_number  | string       | null: false       |
| purchase      | references   | foreign_key: true |

### Association

- belongs_to : purchase


### purchases テーブル

| Columname     | Type         | Options           |
| ------------- | ------------ | ----------------- |
| user          | references   | foreign_key: true |
| item          | references   | foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
- has_one : address
