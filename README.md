# OpenID Connect sample provider
[![Build Status](https://travis-ci.org/hiyosi/tiny-oidc-provider.png)](https://travis-ci.org/hiyosi/tiny-oidc-provider)
[![Coverage Status](https://coveralls.io/repos/hiyosi/tiny-oidc-provider/badge.png?branch=master)](https://coveralls.io/r/hiyosi/tiny-oidc-provider?branch=master)

OpenID Connect Implicit Flow を実装したプロバイダのサンプルアプリケーションです。

## インストール

````
 $ git clone https://github.com/hiyosi/tiny-oidc-provider.git

 $ bundle install
````

## 必要な事前準備
- 鍵の生成

````
 $ mkdir config/keys

 $ cd config/keys

 $ openssl genrsa 2048 > test.pem

````

- 設定値の指定 (以下サンプル)

````.rb
# config/environments/development.rb

require './lib/oidc'

Rails.application.configure do

  OIDC::Config.issuer = 'op.example.com'
  OIDC::Config.scope = %w(openid profile email)
  OIDC::Config.id_token_expire = 3600
  OIDC::Config.rsa_key = './config/keys/test.pem'
end

````

## 動作確認

1. Rails アプリケーションの起動

````
 $ bundle exec rake db:migrate
 $ bundle exec rails s
````

2. ``` http://localhost:3000/applications ``` にアクセスして RP を登録して下さい。

3. sign_in 画面にリダイレクトされるので、その画面から sign_up のリンクをクリックしユーザを登録して下さい。

4. ユーザ登録完了後、RP の登録ページに戻ると思いますので、自身のRPを登録して下さい。


