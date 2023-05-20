Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :orders, only: [:show, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :products do
    resource :orders, only: :create
    collection do
      get 'search'
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
