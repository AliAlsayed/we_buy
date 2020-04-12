Rails.application.routes.draw do
  get 'offer_buyers/create'
  devise_for :users

  root 'deals#index'
  get '/deals', to: 'deals#index', as: 'deals'
  get '/deal/:id', to: 'deals#show', as: 'deal'

  resources :offers, only: [] do
    resources :pledges, only: [:create, :destroy]
  end

  resources :products, except: [:index] do 
    resources :offers
  end

  resources :users, only: [] do
    resources :products, only: [:index]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
