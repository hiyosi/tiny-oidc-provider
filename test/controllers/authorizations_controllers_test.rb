require 'test_helper'
require 'oidc/config'

class AuthorizationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  OIDC::Config.issuer = 'op.example.com'
  OIDC::Config.scope = %w(openid profile email)
  OIDC::Config.id_token_expire = 3600
  OIDC::Config.rsa_private_key = './test/fixtures/keys/test.pem'

  setup do
    @application = FactoryGirl.create(:test_application)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:test_user)
  end

  test 'controller has new action' do
    get :new
    assert_equal 200, response.status
  end

  test 'new action should render "new" template. by correct arguments.' do
    get :new, {
      'response_type' => 'id_token',
      'client_id' => @application.client_id,
      'redirect_uri' => @application.redirect_uri,
      'scope' => 'openid',
      'state' => 'state123',
      'nonce' => 'nonce123',
    }
    assert_equal 200, response.status
    assert_template :new
  end

  test 'controller has create action' do
    post :create, {
      'response_type' => 'id_token',
      'client_id' => @application.client_id,
      'redirect_uri' => @application.redirect_uri,
      'scope' => 'openid',
      'state' => 'state123',
      'nonce' => 'nonce123',
    }
    assert_equal 302, response.status
  end

end
