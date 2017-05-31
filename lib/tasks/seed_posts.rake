
require 'json'
require 'rest-client'

namespace :seed do
  task :posts => :environment do
    1.times do |i|
      user = {user: {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          #email: Faker::Internet.email,
          #password: Faker::Internet.password(4,9)
      }}.to_json
      RestClient.post 'http://localhost:3000/users', user, {content_type: :json, accept: :json}
      sleep 1
    end
  end
end





