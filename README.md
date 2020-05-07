# ナンパされチェッカー
## 本番URL（現在、サービス休止中です）
https://www.nampa-checker.com/

[![Image from Gyazo](https://i.gyazo.com/8d04c8b041246429f8838b360f39706c.gif)](https://gyazo.com/8d04c8b041246429f8838b360f39706c)

## サービス概要
ナンパされてみたい「女装男子」が  
女性に見間違われる確率をweb上で検証できる  
顔認証アプリケーション「ナンパされチェッカー」です。

## 登場人物
### エンドユーザー
- 女装写真をアップロードする人（女性に見間違われたい人）

### 管理者
- 登録された写真を管理する人

## 問題
女装姿で外出してナンパをされたいが  
いきなり女装姿で外に出るのは抵抗感がある。（男だとバレないか怖い）  
自分の女装姿が「女性に見えるのか」をまずはネットで検証してみたい。

## 解決方法
「女性に見間違われた確率」は写真をアップロード後に判定される  
例）アナタが女性に見間違われた確率は〇〇％  
↑見間違われる確率が上がっていけば、自信が付いてリアル（現実）でも  
「ナンパされにいく」ことができるようになる。

## プロダクト
自分の写真が、女性に見間違われる確率を判定できる顔認証アプリケーション

## マーケット
- 女装趣味がありナンパされてみたい人

# 実装した機能
- Twitterログイン(TwitterAPI+Socery)
- 画像アップロード・削除（Active Storage+Amazon S3)
- 顔認証(Amazon Rekognition)
- TwitterOGP対応
[![Image from Gyazo](https://i.gyazo.com/92e9a5a8d3b534e388b33f98223fce81.png)](https://gyazo.com/92e9a5a8d3b534e388b33f98223fce81)
- Google Analyticsでのアクセス解析
- 管理画面(Admin LTE)
[![Image from Gyazo](https://i.gyazo.com/1221dbe953add8cf64a9d4248064c46e.png)](https://gyazo.com/1221dbe953add8cf64a9d4248064c46e)

# 使用技術
## 言語フレームワーク
- Ruby 2.6.4
- Ruby on Rails 5.2.3
- Bootstrap 4(CSSフレームワーク)

## インフラ
- AWS
  - VPC
  - EC2
  - Elastic IP
  - RDS for MySQL 5.7.26
  - Route53
  - S3
  - ACM
## テスト(Rspec)
- 統合テスト(system spec)
