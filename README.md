# ツール・ライブラリの名前


## 簡単な説明

簡単な説明簡単な説明簡単な説明簡単な説明簡単な説明簡単な説明簡単な説明
簡単な説明簡単な説明簡単な説明簡単な説明簡単な説明簡単な説明簡単な説明
簡単な説明簡単な説明簡単な説明簡単な説明簡単な説明簡単な説明簡単な説明
簡単な説明簡単な説明簡単な説明簡単な説明簡単な説明簡単な説明簡単な説明

***デモ***

![デモ](https://image-url.gif)

## 機能

- 機能1（UI/計算 etc ...）
- 機能2
- 機能3
- ...

他の機能はこちらを参照して下さい。`awesome-tool --help`.

## 必要要件

- 要件
- 要件
- 要件
- ...

## 使い方

1. 使い方
2. 使い方
3. 使い方

## インストール

```
$ git clone https://github.com/TomoakiTANAKA/awesome-tool
$ cd awesome-tool
$ sh setup.sh
$ ~do anything~
```

## テスト

1. 使い方
2. 使い方
3. 使い方

## デプロイ

1. デプロイ
2. デプロイ
3. デプロイ

## その他

その他その他その他その他
その他その他その他その他
その他その他その他その他
その他その他その他その他

## 作者

[@TanakanoAnchan](https://twitter.com/TanakanoAnchan)
mail to: xxxx@mail.com

## ライセンス

[MIT](http://TomoakiTANAKA.mit-license.org)</blockquote>

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
