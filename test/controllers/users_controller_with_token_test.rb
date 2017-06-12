require 'test_helper'
require 'bcrypt'

class UsersControllerWithTokenTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    pass = @user.password_digest
    @user.password = BCrypt::Password.create(pass, cost: pass.size)
    @user.save
    uri = URI.parse('http://localhost:3000' + auth_user_path)
    header = {'Content-Type': 'application/json'}
    params = {email: @user.email, password: pass}
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = params.to_json
    response = http.request(request)
    @token = JSON.parse(response.body)['auth_token']
  end

  test "can take up auth token for user" do
    assert @token && !@token.empty?
  end


  test "should create user with authentification" do
    uri = URI.parse('http://localhost:3000' + users_path)
    header = {'Content-Type': 'application/json', 'Authorization': @token}
    params = {user: {email: 'test5@mail.com', first_name: @user.first_name, last_name: @user.last_name, password: 'test'}}
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = params.to_json
    response = http.request(request)
    assert response.code=='201'
    assert response.message=='Created'
  end


  # test "should destroy user with authentification" do
    #assert_response 204
  # end

end
