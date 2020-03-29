Rails.application.routes.draw do
  root 'deals#index'
  get '/deals', to: 'deals#index', as: 'deals'
  resources :products do 
  	resources :offers
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
