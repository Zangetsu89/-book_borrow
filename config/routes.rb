Rails.application.routes.draw do
  # USERS
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'books#home'
  
  # BOOKS
  resources :books do
    resources :reservations, only: ["new", "create", "show", "update"]
  end
end
