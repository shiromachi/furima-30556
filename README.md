## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :managements


## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| title          | string     | null: false                    |
| description    | text       | null: false                    |
| category_id    | integer    | null: false                    |
| status_id      | integer    | null: false                    |
| charge_type_id | integer    | null: false                    |
| area_id        | integer    | null: false                    |
| day_to_ship_id | integer    | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :management

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     | null: false                    |
| region_id   | integer    | null: false                    |
| city        | string     | null: false                    |
| street      | string     | null: false                    |
| building    | string     |                                |
| phone       | integer    | null: false                    |
| management  | references | null: false, foreign_key: true |

### Association
- belongs_to :management

## managements テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :order