Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'components', to: 'pages#components'
  root to: 'pages#home'


  resources :toys, only: [:index, :create, :show, :new, :edit, :destroy] do
    resources :bookings, only: [:create, :new, :edit, :update, :destroy]
  end
  resources :bookings, only: [:show]
  resources :dashboards, only: [:show]
end
