Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resources :orders, only: [:create, :show]
  
  resources :categories, only: [:index] do
    resources :products, only: [:index, :show] 
    # do
    #   resources :reviews, only: [:new, :create]
    # end
  end

  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'
  

end
