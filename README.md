[![rails](https://img.shields.io/badge/Rails-6.1.4.6-red)](https://rubygems.org/gems/rails/versions/6.1.4.6)
[![nuxt](https://img.shields.io/badge/Nuxt.js-2.15.8-brightgreen)](https://www.npmjs.com/package/nuxt/v/2.15.8)

# **Pinap | ピナップ**

![pinap_ogp](https://user-images.githubusercontent.com/77439261/165692368-f134c958-2d29-436d-a518-1069a630309f.png)

## ****■ リポジトリ****

### バックエンド
https://github.com/naon708/search_app_rails

### フロントエンド
https://github.com/naon708/search_app_nuxt

## ****■ サービスURL****

https://pinap.jp/

## ****■ サービス概要****

バレエ動画を、用語の一覧から検索・視聴できるサービスです。

## ****■ ユーザーの悩み****

- バレエ動画をYouTubeで検索したいが、用語がパッと浮かばない。
- 英語、フランス語などで検索するとヒット率が上がるが、いちいちスペルを調べるのが手間。

## ****■ このサービスを使うことで...****

- 一覧表示画面から数回ポチポチするだけで検索・視聴ができる。
- 知見が広がり、より多くのバレエ動画に出会える。

## ****■ 主なページと機能****

| トップページ | 演目一覧ページ |
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/3c2e6477de67abb52e167fd9f149d1a8.gif)](https://gyazo.com/3c2e6477de67abb52e167fd9f149d1a8) | [![Image from Gyazo](https://i.gyazo.com/be9e44e69b86a1d0ab91d744f935c6f8.gif)](https://gyazo.com/be9e44e69b86a1d0ab91d744f935c6f8) |
| 導線をわかりやすくするため、情報量をなるべく少なくすることを意識しました。 | UX向上のためフローティングアクションボタンを実装しました。 |

| 詳細ダイアログ |  検索結果ページ |
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/938d927505fc0490d984b91bc7ecf6f7.gif)](https://gyazo.com/938d927505fc0490d984b91bc7ecf6f7) | [![Image from Gyazo](https://i.gyazo.com/c43e656c78245817ca8ddc09f3871976.gif)](https://gyazo.com/c43e656c78245817ca8ddc09f3871976)　|
| 気に入った項目に目印を付けたいという要望があったため、検索ワードのマーキング機能を実装しました。 | 直感的に操作してもらうため、馴染みのあるYouTube検索結果画面のレイアウトを意識しました。 |

| 再生ダイアログ | ユーザー登録ページ |
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/2eb87c5b4a5705b332fcf83c911c0016.gif)](https://gyazo.com/2eb87c5b4a5705b332fcf83c911c0016) | [![Image from Gyazo](https://i.gyazo.com/dbc77bed0fb8f29893d577ff9d05bd1c.png)](https://gyazo.com/dbc77bed0fb8f29893d577ff9d05bd1c)　|
| YouTubeアプリで視聴したいケースを考慮してリンクを用意しました。また、振付を覚えるために鏡のようにして観たいという要望があったため、左下のトグルボタンで動画を左右反転させる機能を実装しました。 | 登録のハードルを下げるため、emailの代わりにニックネームを採用しました。 |

| ログインページ | お知らせページ |
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/6a4f9c48f8bb84956e09c99fc5541d1b.png)](https://gyazo.com/6a4f9c48f8bb84956e09c99fc5541d1b) | [![Image from Gyazo](https://i.gyazo.com/8522c6e26ebd880076afa5133633f527.png)](https://gyazo.com/8522c6e26ebd880076afa5133633f527)　|
| フロントでもValidationをかけ、送信ボタンを制御しています。多重送信対策も行いました。 | お知らせ内容のデータはFirestoreで保持しています。GUIで手軽に更新できるためです。 |

## ****■ 使用技術****

### **バックエンド**

- Ruby 3.0.1
- Rails 6.1.4.6（APIモード）
- 主要ライブラリ
    - rack-cors
    - seed-fu
    - google-api-client
    - jwt
    - rubocop

### **フロントエンド**

- Vue.js 2.6.14
- Nuxt.js 2.15.8
- Vuetify 2.6.1
- 主要ライブラリ
    - @nuxtjs/auth-next
    - @nuxtjs/axios

### インフラ

- PostgreSQL
- Heroku
- Firebase Hosting
- Cloud Firestore

### 外部API

- YouTube Data API

## ****■ ER図****

[![Image from Gyazo](https://i.gyazo.com/40e83eb90e8e47a4e877981e766ffbd7.png)](https://gyazo.com/40e83eb90e8e47a4e877981e766ffbd7)

[https://gyazo.com/40e83eb90e8e47a4e877981e766ffbd7](https://gyazo.com/40e83eb90e8e47a4e877981e766ffbd7)

## ****■ 画面遷移図****

[https://www.figma.com/file/lsv4Y8c5onHsUPWcx5eWWL/Untitled?node-id=3%3A14](https://www.figma.com/file/lsv4Y8c5onHsUPWcx5eWWL/Untitled?node-id=3%3A14)

## ****■ その他****

- MVPリリース（Nuxt.js × Firebase）
    - 累計PV数：6000回
    - UU数：1600人
- 本リリース（Firebase→Rails）