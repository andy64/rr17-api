Rails.application.routes.draw do
  resources :source_providers
  root to: 'source_providers#noaction'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
