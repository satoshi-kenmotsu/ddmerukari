# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer| |
|nickname|string|null:false|
|email|string|null:false,unique|
|password|string|null:false|
|first_name|string|null:false|
|first_name_kana|string|null:false|
|last_name|string|null:false|
|last_name_kana|string|null:false|
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|
|telephone|integer|null:false,unique|


### Association
has_one :credit
has_one :address
has_many :items



## creditsテーブル
|credit_card_number|integer|unique|
|card_year|integer||
|card_month|integer||
|cvc|integer||
|user_id|integer|foreign_key:ture|

## Association
belongs_to :user



## addressテーブル
|Column|Type|Options|
|------|----|-------|
|prefecture|string|null:false|
|city|string|null:false|
|house_number|string|null:false|
|building|string||
|post_number|integer|null:false|
|user_id|integer|foreign_key:ture|

## Association
belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|description|text|null:false|
|status|text|null:false|
|delivery_charge|text|null:false|
|prefecure|string|null:false|
|delivery_dates|string|null:false|
|price|integer|null:false|
|user_id|integer|foreign_key:ture|
|item_image_id|integer|foreign_key:ture|
|category_id|integer|foreign_key:ture|
## Association
belong_to :user
has_many :items_images
has_many :categories



## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|item_id|references|null:false,foreign_key:true|

## Association
belongs_to :item

## categoreisテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|null:false|
|item_id|string|foreign_key:ture|

## Association
belongs_to item

