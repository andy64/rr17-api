require 'sinatra'
require 'json'

get '/v1' do
  content_type :json
  {provider: 'rr17-api', version: '1'}.to_json
end

