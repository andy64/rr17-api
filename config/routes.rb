Rails.application.routes.draw do
 namespace :v1 do
    #root to: 'source_providers#noaction'
    resources :source_providers, :source_parsers #,only: [:show, :edit, :update, :destroy]
    get '/courses', to: 'course_results#index'
    get '/courses/history', to: 'course_results#show'
    get 'authentication/payload', to:'authentication#payload'
    post 'auth_user', to: 'authentication#authenticate_user'
    post 'login', to: 'authentication#authenticate_user_sinatra'
    post '/parse_all', to: 'source_providers#parse_all'
    match '/source_provider/:provider_name/start_now', to: 'source_providers#parse_now', provider_name: /[a-zA-Z0-9]+/, via: :post, 
    as: 'parser'
 end

 scope module: 'v1' do
  resources :users
 end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
