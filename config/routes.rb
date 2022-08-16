Rails.application.routes.draw do
  devise_for :users, module: "users"
  get '/login', to: 'sessions#new'
  get 'reservations', to: 'reservations#index'
  post 'reservations', to: 'reservations#create'
  resources :users
  resources :rooms do
    member do
      get 'indexRegistrationList'
    end
    resources :reservations do
      collection do
        post :confirm
      end
    end
  end
  root to: 'users#index'
  get 'area', to: 'rooms#area'
  get 'search', to: 'rooms#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
