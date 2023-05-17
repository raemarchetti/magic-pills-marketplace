Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show, :new, :create] do
    collection do
      get 'search'
    end
  end
  # Defines the root path route ("/")
  resources :orders, only: [:index]
  # root "articles#index"
end
