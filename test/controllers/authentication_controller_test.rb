require 'test_helper'

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should authenticate user" do
    post v1_auth_user_url, params: { email: @user.email, password: @user.password }, as: :json
    assert_response :success
  end

  test "should not authenticate user" do
    post v1_auth_user_url, params: {  email: @user.email  }, as: :json
    assert_response 401
  end


end
