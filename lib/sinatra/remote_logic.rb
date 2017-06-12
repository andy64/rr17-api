require 'sinatra'
require 'json'

get '/' do
  content_type :json
  {provider: 'rr17-api', version: '1'}.to_json
end

