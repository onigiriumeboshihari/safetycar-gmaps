# 危ない通りの口コミを投稿して安全マップ作成！「SafetycarGmaps」
https://safetycar-gmaps.herokuapp.com/

[![Image from Gyazo](https://i.gyazo.com/02b2f5757e9ef61dcb3476f1c42a300e.gif)](https://gyazo.com/02b2f5757e9ef61dcb3476f1c42a300e)


## どんなアプリ？

まずはマップ上の投稿をチェック！

例えば、平日8時15分の外苑通りでは、車の流れが約40km/h、大型車両が少ないことがわかります。

このアプリでは、車の流れのスピードや、大型車両の通行量をみんなで投稿できます。

お子様を幼稚園へ送迎するなど、交通事故のリスク対策のために「通りの口コミ」がチェックできるアプリです！



## 何が便利？

車の流れが遅い通りをチェック!

さらに大型車両が少ない通りをチェックできます！

GoogleMapsや、Honda「SAFETY MAP」ほど詳しいデータはありませんが、

毎日の通勤で感じる「通りの印象」をスピーディにチェックし、安全ルートのカスタマイズをサポートします！


## 使える機能

| 機能一覧           | できること                                        |
| ----------------- | --------------------------------------------- |
| ユーザー管理      | サインアップ、サインイン、サインアウト                     |
| 投稿　　　　　　　 | 画像、スクリプトを投稿！ |
| 投稿一覧         | マップ上にある投稿画像をクリックして投稿をチェック！              |
| コメント           | 気になる投稿にはコメントで質問！                     |
| ユーザー詳細      | さらにユーザーのプロフィールから過去の投稿をまとめてチェック！              |
| 投稿を編集・削除 | 投稿内容の確認・編集                             |

もっと詳しく
https://docs.google.com/spreadsheets/d/1NuQulUwFqS7QxpFDnE5fzaExEepKpEp_-1yTyHN6ypo/edit?pli=1#gid=282075926
（要件定義のスプレッドシートがチェックできます！）

## 利用方法

# 1. トップページ右上「Sign Up」からサインアップ!
[![Image from Gyazo](https://i.gyazo.com/c743cc677597b45dbcc380cb21fb6107.png)](https://gyazo.com/c743cc677597b45dbcc380cb21fb6107)
# 2. 「Let's 投稿」から投稿!
[![Image from Gyazo](https://i.gyazo.com/1b61cca37035e9504afb8091a3681bfe.png)](https://gyazo.com/1b61cca37035e9504afb8091a3681bfe)
# 3. マップから投稿をチェック!そのままコメント!
[![Image from Gyazo](https://i.gyazo.com/4d5c46161696b3b4b8bc7080cb779318.gif)](https://gyazo.com/4d5c46161696b3b4b8bc7080cb779318)
# 4. ユーザー名からユーザー詳細を確認
[![Image from Gyazo](https://i.gyazo.com/3e6f02af3f91d34c5106301053c98dcc.jpg)](https://gyazo.com/3e6f02af3f91d34c5106301053c98dcc)

## インストール

```
$ git clone https://github.com/onigiriumeboshihari/safetycar-gmaps.git
$ cd safetycar-gmaps
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
http:localhost:3000

```

## テスト

- ID/Pass
ID: yamada
Pass: 34824

- テスト用アカウント等
投稿者用
メールアドレス: hanako@email
パスワード: testpass
閲覧者用
メールアドレス名: taro@email
パスワード: testpass
3. 使い方

## 開発環境

- VScode
- Ruby 2.6.5
- Rails 6.0.3.4
- mysql2 0.5.3
- JavaScript
- gem 3.0.3
- heroku 7.46.0

# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| name               | string              | null: false             |
| time               | string              | null: false             |
| place              | string              | null: false             |
| profile            | text                | null: false             |

### Association

* has_many :posts
* has_many :comments

## posts table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| place                               | string     | null: false       |
| time                                | string     | null: false       |
| more                                | text       | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| post        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user
