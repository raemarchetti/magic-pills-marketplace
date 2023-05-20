Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resource :order, only: [:show, :destroy, :create]

  resources :order_items, only: [:create, :update, :destroy, :index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :products do
    collection do
      get 'search'
    end
    member do
      post 'add_to_order_item'
      patch 'update_order_item'
      delete 'remove_from_order_item'
    end
  end
  # Defines the root path route ("/")
  resources :orders, only: [:index]

  get 'order', to: 'orders#show'
  # root "articles#index"
end
