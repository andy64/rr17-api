Rails.application.routes.draw do

  resources :users
  resources :source_providers
  get '/courses', to: 'course_results#index'
  get '/courses/history', to: 'course_results#show'
  root to: 'source_providers#noaction'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
