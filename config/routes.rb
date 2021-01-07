Rails.application.routes.draw do
  devise_for :users
  root to: "animals#index"
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :animals, shallow: true do
    resources :orders, only: [:index, :create]
    resources :comments,only: :create
  end
end