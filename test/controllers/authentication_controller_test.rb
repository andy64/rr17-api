require 'test_helper'

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should authenticate user" do
    post v1_auth_user_path, params: { email: @user.email, password: 'admin' }, as: :json
    assert_response :success
    assert response.body.include?('auth_token')
  end

  test "should not authenticate user without password" do
    post v1_auth_user_path, params: {  email: @user.email  }, as: :json
    assert_response 401
  end


end
