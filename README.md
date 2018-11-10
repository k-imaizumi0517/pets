# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|introduction|text|
|prefecture_id|references|foreign_key: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|image|string|

### Association
- has_many :dogs, dependent: :destroy
- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy
- belongs_to :prefecture, optional: true

## dogsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|age_id|references|foreign_key: true|
|introduction|text|null: false|
|type_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :user
- belogns_to :type
- belongs_to :age

## typesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :dogs

## agesテーブル

|Column|Type|Options|
|------|----|-------|
|num|integer|

### Association
- has_many :dogs

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post

## postsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments, dependent: :destroy
- belongs_to :category

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :posts

## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :users
