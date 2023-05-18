Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resource :order, only: [:show]
  post "/order/add_to_order_product", to: "orders#add_to_order_product", as: "add_to_order"
  patch "/order/update_order_product", to: "orders#update_order_product", as: "update_order"
  delete "/order/remove_from_order_product/:product_id", to: "orders#remove_from_order_product", as: "remove_from_order"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show] do
    collection do
      get 'search'
    end
    member do
      post 'add_to_order'
      patch 'update_order_item'
      delete 'remove_from_order'
    end
  end
  # Defines the root path route ("/")
  resources :orders, only: [:index]

  get 'order', to: 'orders#show'
  # root "articles#index"
end
