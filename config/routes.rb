Rails.application.routes.draw do
  get 'home/index'
  #devise_for :users

  devise_for :admins
  devise_for :buyers
  devise_for :brokers

  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
