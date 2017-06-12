require 'test_helper'


class UsersControllerWithoutTokenTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
  end


  test "should get index" do
    get v1_users_url, as: :json
    assert_response :success
  end

  test "should not create user without authentification" do
    assert_difference('User.count', 0) do
      post v1_users_url,
           params: {user: {email: 'test@mail.com', first_name: @user.first_name, last_name: @user.last_name, password: 'test'}},
           as: :json
    end
    assert_response 401
  end

  test "should show user" do
    get v1_user_url(@user), as: :json
    assert_response :success
  end

  test "should forbid updating user without authentification" do
    patch v1_user_url(@user), params: {user: {email: @user.email, first_name: @user.first_name, last_name: @user.last_name, password: @user.password}}, as: :json
    assert_response 401
    assert response.body=="{\"errors\":[\"Not Authenticated\"]}"
  end

  test "should forbid to destroy user without authentification" do
    assert_difference('User.count', 0) do
      delete v1_user_url(@user), as: :json
    end
    assert_response 401
    assert response.body=="{\"errors\":[\"Not Authenticated\"]}"
  end

end
