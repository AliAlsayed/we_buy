Rails.application.routes.draw do
  
  devise_for :users

  root 'deals#index'
  get '/deals', to: 'deals#index', as: 'deals'
  get '/deal/:id', to: 'deals#show', as: 'deal'
  
  resources :offers, only: [:show] do
    resources :pledges, only: [:create, :destroy]
  end

  resources :products, except: [:index, :show] do 
    resources :offers
  end

  resources :users, only: [] do
    resources :products, only: [:index]
    resources :offers, only: [:index]
    resources :orders, only: [:index]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  