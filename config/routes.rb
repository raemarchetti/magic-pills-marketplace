Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

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
