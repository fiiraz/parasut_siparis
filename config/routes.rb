Rails.application.routes.draw do
  resources :orders
  resources :categories
  root "orders#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
