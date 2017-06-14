require 'test_helper'
require 'bcrypt'

class UsersControllerWithTokenTest < ActionDispatch::IntegrationTest


  setup do
    @user = users(:one)
    post v1_auth_user_path, params: { email: @user.email, password: 'admin' }, as: :json
    @token ||= JSON.parse(response.body)['auth_token']
  end

  test "can take up auth token for user" do
    assert @token && !@token.empty?
  end


  test "should create user with authentification" do
    post v1_users_path,
         params:{user: {email: 'test5@mail.com', first_name: @user.first_name, last_name: @user.last_name, password: 'test'}},
         headers:{'Content-Type': 'application/json', 'Authorization': @token},
         as: :json
    @id = JSON.parse(response.body)['id']
    assert response.code=='201'
    assert response.message=='Created'
  end

   test "shouldnot destroy last user with authentification" do
     delete v1_user_path(1),
          headers:{'Content-Type': 'application/json', 'Authorization': @token},
          as: :json
     assert response.code=='400'
     assert response.body=="{errors:[{destroyed:false, message:cannot remove the last user}], status: 400}"
   end

end
