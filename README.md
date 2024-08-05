## users
| Column Name          | Data Type | Constraints            |
|----------------------|-----------|------------------------|
| user_id              | references| NOT NULL               |
| nick_name            | string    | NOT NULL               |
| mail_address         | string    | NOT NULL, unique       |
| password             | string    | NOT NULL               |
| user_image           | string    | NOT NULL               |
| introduction         | string    | NOT NULL               |
### Association
- has_many :destination
- has_many :items
- has_many :items_images
- has_many :comments

## destination
| Column Name          | Data Type | Constraints            |
|----------------------|-----------|------------------------|
| destination_id       | references| NOT NULL               |
| user_id              | references| NOT NULL, foreign key  |
| family_name          | string    | NOT NULL               |
| first_name           | string    | NOT NULL               |
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
| name                 | string    | NOT NULL               |
| detail               | string    | NOT NULL               |
| price                | string    | NOT NULL               |
| created_at           | string    | NOT NULL               |
| update_at            | string    | NOT NULL               |
| delete_flg           | string    | NOT NULL               |
### Association
- belongs_to :user
- has_many :items_images
- has_many :comments

## item_images
| Column Name          | Data Type | Constraints            |
|----------------------|-----------|------------------------|
| item_id              | references| NOT NULL, foreign key  |
| image_url            | references| NOT NULL               |
### Association
- belongs_to :items

## comments
| Column Name          | Data Type | Constraints            |
|----------------------|-----------|------------------------|
| item_id              | references| NOT NULL, foreign key  |
| user_id              | references| NOT NULL, foreign key  |
| text                 | text      | NOT NULL               |
### Association- has_many :destination
- belongs_to :items