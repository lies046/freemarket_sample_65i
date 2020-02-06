# 1.アプリケーションの概要
- 某スクールの最終課題で作成したフリマアプリのクローンです。  
- URL: http://18.177.71.146  
- 開発期間 : 4週間  
- 人数 : 4人  


# 2.アプリケーションの機能一覧
- ユーザー新規登録  
- 商品出品,編集,削除  
- クレジットカードによる商品購入  
- クレジットカード登録  

# 3.使用技術一覧
- Ruby  
- Ruby on Rails  
- MySQL  
- jQuery  
- Haml  
- Scss  
- Github  


# 4.担当箇所
- ユーザー新規登録(フロント)  
- ユーザープロフィール編集(フロント)
- 商品購入確認ページ(フロント)
- 商品購入(サーバー)
- 商品編集(サーバー)
- ユーザー新規登録単体テスト


# 5.ER図
![ER図](https://user-images.githubusercontent.com/51071762/71051846-de7b9300-218c-11ea-8bc9-790b0d948d52.jpeg)


## usersテーブル
|Column|Type|options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|nickname|string|null: false, unique: true|
|mail|string|null: false, unique: true|
|password|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|comment|text|null: false|
|phone_number|string|null: false, unique: true|

### Associatioin
- has_many :buyer_products, class_name: 'Product', foreign_key: 'buyer_id'
- has_many :seller_products, class_name: 'Product', foreign_key: 'seller_id'
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_one :street_addresses
- has_one :creditcards
- has_many :sns_credentials, dependent: :destroy

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|comment|text|null: false|
|size|string|	
|status|integer|null: false, enumで管理|
|costcharge|string|null: false|
|delivery_way|string|null: false|
|delivery_area|string|null: false|
|delivery_date|string|null :false|
|price|integer|null: false|
|buyer_id|integer|class_name: "User"|
|seller_id|integer|class_name: "User"|
|category_id|references|null: false,foreign_key: true|
|brand_id|integer|foreign_key: true|

### Associatioin
- belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- belongs_to :category
- belongs_to :brand
- has_many :images

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|uid|string|null: false, unique: true|
|provider|string|null: false|

### Association
- belongs_to :user, optional: true

## creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|card_id|integer|null: false|
|customer_id|integer|null: false|

### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false,foreign_key: true|
|product_id|references|null: false,foreign_key: true|

### Associatioin
- belongs_to :user
- belongs_to :product_id

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|genre|string|null: false, unique: true|
|ancestry|string||

### Associatioin
- has_many :products
- has_ancestry

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Associatioin
- has_many :products

## street_addressテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|post_number|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
|phone_number|string||
|user_id|references|null: false,foreign_key: true|

### Associatioin
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|url|text|null: false|
|product_id|references|null:false,foreign_key:true|

### Associatioin
belongs_to :product