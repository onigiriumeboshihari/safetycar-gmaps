# オリジナルアプリで危ない通りの口コミをチェック！
https://safetycar-gmaps.herokuapp.com/


```
ユーザーアカウント
メールアドレス: taro@email
パスワード: testpass
```

[![Image from Gyazo](https://i.gyazo.com/c6c6b141281d1d34140c9dfe7c055ebe.gif)](https://gyazo.com/c6c6b141281d1d34140c9dfe7c055ebe)


## どんなアプリ？

**交通事故のリスク対策のために「通りの口コミ」がチェックできるアプリです！**

まずはマップ上の投稿をチェック！

例えば、平日14時00分の赤坂通りでは、車の流れが約50~60km/h、大型車両が少ないことがわかります。

このアプリでは、車の流れのスピードや、大型車両の通行量をみんなで投稿できます。


## 何が便利？

**毎日の通勤で感じる「通りの印象」をスピーディにつかみ、安全なルートのカスタマイズをサポートします！**

車の流れが遅い通りをチェック!

さらに大型車両が少ない通りをチェックできます！

GoogleMapsや、Honda「SAFETY MAP」ほど膨大なデータはありませんが、

**車の流れが遅い時間帯や、大型車両が少ない口コミをチェックすることができます！**

## 使える機能

| 機能一覧           | できること                                        |
| ----------------- | --------------------------------------------- |
| ユーザー管理      | サインアップ、サインイン、サインアウト                     |
| 投稿　　　　　　　 | 画像、口コミを投稿！ |
| 投稿一覧         | みんなの投稿した口コミは、マップ上からチェック！              |
| コメント           | 気になる口コミにはコメントで質問！                     |
| ユーザー詳細      | さらにユーザーのプロフィールから過去の口コミをまとめてチェック！              |
| 投稿を編集・削除 | 撮り直しの画像をアップデート！                             |

[要件定義のスプレッドシートからさらに詳しくチェックできます！](https://docs.google.com/spreadsheets/d/1NuQulUwFqS7QxpFDnE5fzaExEepKpEp_-1yTyHN6ypo/edit?pli=1#gid=282075926)

## 利用方法

# 1. トップページ右上「Sign Up」からサインアップ!
[![Image from Gyazo](https://i.gyazo.com/ae42eb1de52ea0bfe9c02e6bf4b67ea2.png)](https://gyazo.com/ae42eb1de52ea0bfe9c02e6bf4b67ea2)
# 2. 「Let's 投稿」から口コミ投稿!
[![Image from Gyazo](https://i.gyazo.com/f3bffb8c7039eba49c535b859fc14592.png)](https://gyazo.com/f3bffb8c7039eba49c535b859fc14592)
# 3. マップから口コミをチェック!そのままコメント!
[![Image from Gyazo](https://i.gyazo.com/6bd8a6fd4456f7829a09b606c2babc5a.gif)](https://gyazo.com/6bd8a6fd4456f7829a09b606c2babc5a)
# 4. ユーザープロフィールから過去の口コミをまとめてチェック！
[![Image from Gyazo](https://i.gyazo.com/39d0c656ab7cd7ffb88c6b0e996a7775.jpg)](https://gyazo.com/39d0c656ab7cd7ffb88c6b0e996a7775)

##### 課題

```
- ユーザー情報を修正できない点
- 地図に開発中の表示が出る点
```

##### インストール

```
% git clone https://github.com/onigiriumeboshihari/safetycar-gmaps.git
% cd safetycar-gmaps
% bundle install
% rails db:create
% rails db:migrate
% rails s
http:localhost:3000
```

###### 開発環境

```
- VScode
- Ruby 2.6.5
- Rails 6.0.0
- mysql2 0.5.3
- JavaScript
- gem 3.0.3
- heroku 7.46.0
```

##### DB 設計

###### users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| name               | string              | null: false             |
| time               | string              | null: false             |
| place              | string              | null: false             |
| profile            | text                | null: false             |

###### Association

* has_many :posts
* has_many :comments

###### posts table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| place                               | string     | null: false       |
| time                                | string     | null: false       |
| more                                | text       | null: false       |
| user                                | references | foreign_key: true |

###### Association

- belongs_to :user
- has_many :comments

###### comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| post        | references | foreign_key: true |
| user        | references | foreign_key: true |

###### Association

- belongs_to :post
- belongs_to :user
