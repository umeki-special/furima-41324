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
| birth_day            | string    | null: false            |
### Association
- has_many :items
- has_many :history

## destination
| Column Name          | Data Type | Constraints            |
|----------------------|-----------|------------------------|
| post_code            | string    | null: false            |
| city                 | string    | null: false            |
| address              | string    | null: false            |
| phone_number         | string    | null: false            |
### Association
- belongs_to :user

## items
| Column Name          | Data Type | Constraints            |
|----------------------|-----------|------------------------|
| user                 | references| null: false            |
| price                | integer   | null: false            |
| name                 | string    | null: false            |
| status_id            | integer   | null: false            |
| shipping method_id   | integer   | null: false            |
| estimated shipping date_id| integer    | null: false      |
| comment              | text      |                        |
| favorite_id          | integer   |                        |
| report_id            | integer   |                        |
### Association
- belongs_to :user

## history
| Column Name          | Data Type | Constraints            |
|----------------------|-----------|------------------------|
| item_id              | references| null: false            |
| item_name            | string    | null: false            |
| price                | integer   | null: false            |
### Association
- belongs_to :user