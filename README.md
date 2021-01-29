# Pet-Shelter
## ペットの里親になりたい方とペットを里親に出したい方を繋ぐアプリ
![README画像1](https://user-images.githubusercontent.com/73101158/106101793-bf1daa80-6181-11eb-95c5-dee56999bbb2.jpg)

# ■ 概要
**全国で年間約10万頭の犬・猫が殺処分されている。**<br>
**このような状況であることを広め、不幸なペットを減らすことを目的としている。**<br>

- ログインしたユーザーは里親を募集したり、里親を申し出ることができます。<br>
- また、ペットに関して双方に質問やコメントを送ることができます。

# 🌐 URL
https://pet-shelter1.herokuapp.com/

# テスト用アカウント
**ユーザー1**
- name: テスト1
- email: test1@test.com
- password: testtest1

**ユーザー2**
- name: テスト2
- email: test2@test.com
- password: testtest2

**ゲストログイン**
- 「ゲストログイン」ボタン押下。全ての操作可能。

# 利用方法
**トップ画面**<br>
- ログイン前<br>
<img width="415" alt="README画像2" src="https://user-images.githubusercontent.com/73101158/106222429-de204900-6222-11eb-8661-7c6cd4a4b88c.png"><br>

**<font color="Red">※新規登録を省略する為、「ゲストログイン」ボタンを実装</font>**
- ログイン後<br>
<img width="301" alt="RERADME画像3" src="https://user-images.githubusercontent.com/73101158/106222437-e1b3d000-6222-11eb-9eeb-fcf6077a239f.png"><br>
前後で表示が切り替わる<br>

# 新規登録画面<br>
入力必須項目が一つでも空の場合、他の画面に遷移しない。<br>
# ログイン画面<br>
入力必須項目が一つでも空の場合、他の画面に遷移しない。<br>
# 里親募集の登録<br>
- 右下の「里親募集」ボタンより、ペットの登録ができる。<br>
[![Image from Gyazo](https://i.gyazo.com/37d8691385f87a6e635d861fdebfbc6e.gif)](https://gyazo.com/37d8691385f87a6e635d861fdebfbc6e)<br>

# 里親募集の登録(未ログインの場合)<br>
- **<font color="red">ログイン画面へ遷移し、登録できない。**</font><br>
[![Image from Gyazo](https://i.gyazo.com/38e0d140a1e47900bca2aa2b7058010f.gif)](https://gyazo.com/38e0d140a1e47900bca2aa2b7058010f)<br>

# ペット一覧表示<br>
- **GEM「kaminari」を利用し、ページネーション機能実装**
[![Image from Gyazo](https://i.gyazo.com/a49212e8717ff73a134fb80572041485.jpg)](https://gyazo.com/a49212e8717ff73a134fb80572041485)

# ペット詳細表示<br>
- **ユーザー自身が登録者の場合**<br>
「編集」ボタンと「削除」ボタンが表示
[![Image from Gyazo](https://i.gyazo.com/bb22d812570e80f8ce142fcdb459e896.png)](https://gyazo.com/bb22d812570e80f8ce142fcdb459e896)

 - **登録者以外のユーザーが閲覧した場合**<br>
 「ペット引取」ボタンが表示
 [![Image from Gyazo](https://i.gyazo.com/d0bed65694c088561193175c594af67f.jpg)](https://gyazo.com/d0bed65694c088561193175c594af67f)

 - **里親決定後の場合**<br>
 ボタンが消え、写真左上に「里親決定」の帯が表示される
 [![Image from Gyazo](https://i.gyazo.com/6170d93e98b0d04f748f2ff01b293237.jpg)](https://gyazo.com/6170d93e98b0d04f748f2ff01b293237)
 - **画面下部に質問・コメント機能を実装
 [![Image from Gyazo](https://i.gyazo.com/e3d3a2ac63b85a4a427988fddbca260d.gif)](https://gyazo.com/e3d3a2ac63b85a4a427988fddbca260d)

# 課題解決
様々な事情でペットを飼えなくなった方々と、ペットの里親になりたいと考えている方<br>
を引き合わせ、保健所で殺処分される動物の数を少しでも減らす。


# 🖥 開発環境
- VScode
- Ruby 2.6.5
- Rails 6.0.3.4
- mysql2 5.6.50
- gem 3.0.3
- heroku 7.47.11


# データベース設計
## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| user_birthday      | date    | null: false |

### Association

- has_many :animals
- has_many :orders

## animals テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| animal_name         | string     | null: false                    |
| current_location    | string     | null: false                    |
| animal_age          | string     | null: false                    |
| type                | string     | null: false                    |
| male_female_id      | integer    | null: false                    |
| vaccine_id          | integer    | null: false                    |
| background          | text       | null: false                    |
| personality         | string     | null: false                    |
| health              | string     | null: false                    |
| transfer_method     | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one   :order

## parents_info テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |


### Association

- belongs_to :order

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| animal        | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :animal
- has_one    :parents_info
