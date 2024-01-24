# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root to: "main#index"
  get "about", to: "about#index"

  get "password", to: "password#edit", as: :edit_password
  patch "password", to: "password#update"

  get "sign_up", to: "registration#new"
  post "sign_up", to: "registration#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password/reset", to: "password_resets#new"
  get "password/reset", to: "password_resets#create"

  delete "logout", to: "sessions#destroy"
end
