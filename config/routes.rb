Rails.application.routes.draw do
  devise_for :users
  get 'animals/index'
  root to: "animals#index"
end
