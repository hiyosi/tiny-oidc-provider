# OpenID Connect sample provider


## 必要な事前準備
- 鍵の生成

````
 $ mkdir -p ${RAILS_ROOT}/config/keys

 $ cd ${RAILS_ROOT}/config/keys

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
