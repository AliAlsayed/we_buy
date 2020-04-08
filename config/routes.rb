Rails.application.routes.draw do
  devise_for :users

  root 'deals#index'
  get '/deals', to: 'deals#index', as: 'deals'

  resources :products, except: [:index] do 
    resources :offers
  end

  resources :users, only: [] do
    resources :products, only: [:index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
