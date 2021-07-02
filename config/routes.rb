Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trainers do
    resources :bookings, only: [:new, :create, :show]
  end

  resources :bookings, only: [:destroy]


  resources :users, :only => [:show]
end
