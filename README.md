## users
| Column Name          | Data Type | Constraints            |
|----------------------|-----------|------------------------|
| nick_name            | string    | NOT NULL               |
| mail_address         | string    | NOT NULL, unique       |
| password             | string    | NOT NULL               |
| re_password          | string    | NOT NULL               |
| family_name          | string    | NOT NULL               |
| first_name           | string    | NOT NULL               |
| family_name_kana     | string    | NOT NULL               |
| first_name_kana      | string    | NOT NULL               |
| birth_day            | string    | NOT NULL               |
### Association
- has_many :destination
- has_many :items

## destination
| Column Name          | Data Type | Constraints            |
|----------------------|-----------|------------------------|
| destination_id       | references| NOT NULL               |
| user_id              | references| NOT NULL, foreign key  |
| post_code            | string    | NOT NULL               |
| prefecture           | string    | NOT NULL               |
| city                 | string    | NOT NULL               |
| address              | string    | NOT NULL               |
| building_name        | string    | NOT NULL               |
| phone_number         | string    | NOT NULL               |
### Association
- belongs_to :user

## items
| Column Name          | Data Type | Constraints            |
|----------------------|-----------|------------------------|
| item_id              | references| NOT NULL, foreign key  |
| user_id              | references| NOT NULL, foreign key  |
| price                | string    | NOT NULL               |
| name                 | string    | NOT NULL               |
| status               | string    | NOT NULL               |
| shipping method      | string    | NOT NULL               |
| estimated shipping date| string    | NOT NULL               |
| comment              | text      |                        |
| favorite             | string    |                        |
| report               | string    |                        |
### Association
- belongs_to :user

