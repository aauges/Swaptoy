Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # devise_for :users
  root to: 'pages#home'
  get '/kitchensink', to: 'pages#kitchensink'
  resources :toys, only: [:index, :create, :show, :new, :edit, :destroy]
end
