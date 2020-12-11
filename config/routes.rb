Rails.application.routes.draw do
  devise_for :users
  root to: "animals#index"

  resources :animals, only: [:index, :new, :create]
end
