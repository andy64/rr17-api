source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# TODO group gems
gem 'rails', '~> 5.1.1'
# delayedjob sidekiq resque suckerpanch kafka
# pundit cancan rolify
#json api RFC review!
gem 'nokogiri'
gem 'jwt'
gem 'canable'
gem 'sinatra'
gem 'sinatra-sequel'
gem 'sequel'
gem "rack-reverse-proxy", require: "rack/reverse_proxy"
#####################
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# gem 'mongo'
gem 'mongoid'

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use ActiveModel has_secure_password
#gem install bcrypt -v '3.1.11' --platform=ruby for windows
gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'

gem 'delayed_job_active_record'
gem 'delayed_job', '4.1.4'
# gem 'bcrypt', '~> 3.1.7'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  #gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker'
  gem 'rest-client'

end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
