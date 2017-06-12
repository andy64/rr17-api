
require 'json'
require 'rest-client'

namespace :seed do
  task :users => :environment do
    1.times do |i|
      user = {user: {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: Faker::Internet.email,
          password: Faker::Internet.password(4,9)
      }}.to_json
      RestClient.post 'http://localhost:3000/v1/users', user, {content_type: :json, accept: :json}
      sleep 1
    end
  end
  task :auth => :environment do
    1.times do |i|
      user = {
          email: 'admin@email.com',
          password: 'admin'
      }.to_json
      RestClient.post 'http://localhost:3000/v1/auth_user', user, {content_type: :json, accept: :json}
    end
  end
end





