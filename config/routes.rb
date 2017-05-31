Rails.application.routes.draw do


  scope '/v1' do
    resources :users, :source_providers, :source_parsers #,only: [:show, :edit, :update, :destroy]
    get '/courses', to: 'course_results#index'
    get '/courses/history', to: 'course_results#show'
    root to: 'source_providers#noaction'
    match '/source_provider/:provider_name/start_now', to: 'source_providers#parse_now', id: /[a-z]+/, via: :all
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
