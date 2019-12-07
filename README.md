# README

# DB設計

## stationsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index|

### Association
- has_many :comments


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index|

### Association
- has_many :comments


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|content|text|null: false|
|rent_price|string|
|rent_price|string|
|station_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :stations
- belongs_to :categories
- belongs_to :users


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|nickname|string|null: false, unique: true|

### Association
- has_many :comments
