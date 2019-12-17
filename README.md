# README

# DB設計

## stationsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index|
|image|string|null: false|

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
|station_id|integer|null: false|
|category_id|integer|null: false|
|user_id|integer|null: false|

### Association
- belongs_to :stations
- belongs_to :categories
- belongs_to :users


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false|

### Association
- has_many :comments
