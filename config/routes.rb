Rails.application.routes.draw do
  get 'home/index'

  devise_for :admins
  devise_for :buyers
  devise_for :brokers

  root "home#index"

  get 'admins/dashboard'
  get 'admins/index'
  get 'admins/new_user'
  get 'admins/create_user'

end
