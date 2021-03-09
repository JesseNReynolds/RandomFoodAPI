Rails.application.routes.draw do
  resources :past_results, only: [:create]
  
  resources :users, only: [:create] do
    resources :past_results, only [:index]
  end

  post '/query', to: 'yelp_query#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
