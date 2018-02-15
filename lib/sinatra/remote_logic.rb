require 'json'
require 'sequel'
require 'bcrypt'
require 'sinatra'
require_relative '../../lib/json_web_token'

get '/v1' do
  content_type :json
  {provider: 'rr17-api', version: '1'}.to_json
end

post '/v1/login' do
  par = JSON.parse(request.body.read)
  db = Sequel.connect(adapter: :postgres, database: 'rr17-api_development', host: 'localhost', user: 'postgres', password: 'superuser')
  user = db[:users].where(email: par['email']).first
  if user && BCrypt::Password.new(user[:password_digest]).is_password?(par['password'])
    content_type :json
    payload(user).to_json
  else
    content_type :json
    {errors: ['Invalid Username/Password'], status: 400}.to_json
  end
end

get /\/docs(.*)/ do
  send_file 'doc.html'
end

def payload(user)
  return nil unless user
  {
      auth_token: JsonWebToken.encode(user_id: user[:id]),
      user: {id: user[:id], email: user[:email]}
  }
end
