Rails.application.routes.draw do
  get 'home/index'

  devise_for :admins
  devise_for :buyers
  devise_for :brokers

  root "home#index"

  get 'admins/dashboard'
  get 'admins/index'
  get 'admins/new/user'  => 'admins#new_user',   as: 'admins_new_user'
  post 'admins/new/user' => 'admins#create_user', as: 'admins_create_user'
  get 'admins/view/user/:id' => 'admins#view_user', as: 'admins_view_user'
  get 'admins/edit/user/:id' => 'admins#edit_user', as: 'admins_edit_user'
  put 'admins/edit/user/:id' => 'admins#update_user', as: 'admins_update_user'

end
