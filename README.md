# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|introduction|text|
|prefecture_id|references|null: false, foreign_key: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|image|string|

### Association
- has_many :pets, dependent: :destroy
- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy
- belongs_to :prefecture

## dogsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|age|integer|null: false|
|introduction|text|null: false|
|type_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :images, dependent: :destroy
- belogns_to :type

## typesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :pets

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|dog_id|references|null: false, foreign_key: true|

### Association
- belongs_to :dog

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
|name|string|null: false|

### Association
- has_many :posts

## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :users
