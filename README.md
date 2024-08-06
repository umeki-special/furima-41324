## users
| Column Name          | Data Type | Constraints            |
|----------------------|-----------|------------------------|
| nick_name            | string    | null: false            |
| email                | string    | null: false, unique: true |
| encrypted_password   | string    | null: false            |
| family_name          | string    | null: false            |
| first_name           | string    | null: false            |
| family_name_kana     | string    | null: false            |
| first_name_kana      | string    | null: false            |
| birth_day            | date      | null: false            |
### Association
- has_many :items
- has_many :histories

## destinations
| Column Name          | Data Type | Constraints            |
|----------------------|-----------|------------------------|
| post_code            | string    | null: false            |
| history_id           | references| null: false            |
| prefecture_id        | integer   | null: false            |
| city                 | string    | null: false            |
| address              | string    | null: false            |
| address2             | string    |                        |
| phone_number         | string    | null: false            |
### Association
- belongs_to :history

## items
| Column Name          | Data Type | Constraints            |
|----------------------|-----------|------------------------|
| user                 | references| null: false, foreign_key: true|
| price                | integer   | null: false            |
| name                 | string    | null: false            |
| description_of_item  | text      | null: false            |
| category_id          | integer   | null: false            |
| status_id            | integer   | null: false            |
| shipping_method_id   | integer   | null: false            |
| region_of_origin_id  | integer   | null: false            |
| estimated_shipping_date_id| integer | null: false         |
### Association
- belongs_to :user
- has_one :history

## histories
| Column Name          | Data Type | Constraints            |
|----------------------|-----------|------------------------|
| item                 | references| null: false            |
| user                 | references| null: false            |
### Association
- belongs_to :user
- has_one :destination
- belongs_to :items