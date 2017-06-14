# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require 'rack/reverse_proxy'
run Rails.application



use Rack::ReverseProxy do
  # reverse_proxy /^\/documentation\/?(.*)$/, 'http://localhost:4567/$1'
  reverse_proxy /^\/v1$/, 'http://localhost:4567/'
end