# 通りのクチコミを投稿して安全マップ作成！「SafetycarGmaps」

[![Image from Gyazo](https://i.gyazo.com/92cd25bdff674ef83881ed67fb1b85df.jpg)](https://gyazo.com/92cd25bdff674ef83881ed67fb1b85df)


## どんなアプリ？

まずは地図上の投稿をチェック！

例えば、平日８時15分の外苑通りでは、車の流れが約40km/h、大型車両が少ないことがわかります。

このアプリでは、車の流れのスピードや、大型車両の通行量をみんなで投稿します。

お子様を幼稚園へ送迎するなど、交通事故のリスク対策のために「通りのクチコミ」がチェックできるアプリです！



## 何が便利？

車の流れが遅い通りをチェックできます！

車の流れが速すぎて、法定速度で走っているとハラハラすることを少なくします。

大型車両が少ない通りをチェックできます！

大きなトラックとすれ違ってハラハラすることを少なくします。


## 機能

| 機能一覧           | できること                                        |
| ----------------- | --------------------------------------------- |
| ユーザー管理      | サインアップ、ログイン、ログアウト                     |
| ユーザー詳細      | ユーザーのプロフィール、投稿一覧チェック！              |
| 投稿　　　　　　　 | 画像、撮影時間、流れのスピード、大型車両の通行量等を投稿！ |
| 投稿一覧         | よく運転する通りの情報を地図上でチェック！              |
| 投稿詳細・編集・削除 | 投稿内容の確認・編集                             |
| コメント           | 気になる投稿にはコメントで質問！                     |

他の機能はこちらを参照して下さい。`awesome-tool --help`.

## 必要要件

- トップページ地図上でマーカーが表示されている
- マーカーをクリックすると投稿内容が確認できる
- 投稿ボタンをクリックすると投稿できる
- コメントボタンをクリックするとコメントが投稿できる

他の必要要件はこちらを参照して下さい。

## 使い方

1. トップページからサインアップ・ログイン
2. トップページから投稿
3. トップページから投稿を確認
4. 投稿詳細ページからコメント
5. ユーザー名からユーザー詳細を確認

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
