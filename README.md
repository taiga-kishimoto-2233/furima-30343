# README

# テーブル設計

### users テーブル

| Columname     | Type   | Options     |
| ------------- | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| last_name     | string | null: false |
| first_name    | string | null: false |
| last_name_f   | string | null: false |
| first_name_f  | string | null: false |
| birtday_year  | string | null: false |
| birtday_month | string | null: false |
| birtday_day   | string | null: false |
| phone_number  | text   | null: false |

### Association

- has_many : items
- has_many : purchase


### items テーブル

| Columname  | Type          | Options     |
| ---------- | ------------- | ----------- |
| item_name  | string        | null: false |
| image      |               |             |
| text       | text          | null: false |
| category   | string        | null: false |
| status     | string        | null: false |
| charges    | string        | null: false |
| area       | string        | null: false |
| date       | string        | null: false |
| price      | string        | null: false |
| user       | references    |             |

### Association

- has_one : purchase
- belongs_to : users


### purchase テーブル

| Columname     | Type         | Options     |
| ------------- | ------------ | ----------- |
| card_number   | string       | null: false |
| month         | string       | null: false |
| year          | string       | null: false |
| security_code | string       | null: false |
| postal_code   | string       | null: false |
| prefectures   | string       | null: false |
| municipality  | string       | null: false |
| address       | string       | null: false |
| building      | string       | null: false |
| phone_number  | string       | null: false |
| comment       | text         | null: false |
| user          | references   |             |
| item          | references   |             |

### Association

- belongs_to : users
- belongs_to : items
