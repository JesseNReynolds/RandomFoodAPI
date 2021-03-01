Rails.application.routes.draw do
  resources :past_results
  resources :users
  get '/query', to: 'yelp_query#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
