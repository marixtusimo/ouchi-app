# README
## アプリ概要
アパートの空きを解消したい大家さんとアパートを借りたい人をマッチングさせるアプリケーションです
## アプリURL
https://ouchi-app.herokuapp.com/

ゲストユーザー及びゲストオーナーを用意しておりますのでそちらでご覧頂くと入力不要でご覧いただけます。
## アプリケーション機能一覧
CRUD機能（投稿、編集、削除）、物件検索機能、チャット機能、ゲストログイン機能、ログイン機能
## アプリケーション内で使用している技術一覧
インフラ：
heroku

データベース：
sequel-pro

画像アップロード：
acive_storage
AWS(S3)

デプロイ：
heroku

テスト：
RSpec(単体・結合)

導入ジェム：
rubocop、jquery、devise、pry-rails、mini_magick、image_processing, '~> 1.2'、aws-sdk-s3、unicorn
## 目指した課題解決
情報の非対称性の解消です。理由は３つです。

1. 大家が不動産仲介業者を介して入居させた場合、不動産仲介業者に仲介料金の支払いをしなければならない

2. 借主が不動産仲介業者の営業トークに乗せられて本来住みたい場所や間取り等の妥協をしてしまう

3. 大家と借主の直接のやりとりを行うことができる

以上の３点を本アプリで解消することをゴールとしています。