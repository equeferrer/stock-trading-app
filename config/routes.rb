Rails.application.routes.draw do
  devise_for :admins
  devise_for :buyers
  devise_for :brokers

  get 'stocks/search'
  post 'stocks/search' => 'stocks#create', as: 'stocks_create'
  get 'stocks/show/:id' => 'stocks#show', as: 'stocks_show'
  put 'stocks/broker/add/:id' => 'stocks#broker_add', as: 'stocks_broker_add'
  get 'stocks/buyer/new/:id' => 'stocks#buyer_new', as: 'stocks_buyer_new'
  post 'stocks/buyer/create/:id' => 'stocks#buyer_create', as: 'stocks_buyer_create'

  get 'home/index'
  root "home#index"
  get 'home/transactions'
  get 'portfolio/broker' => 'home#broker_portfolio', as: 'home_broker_portfolio'
  get 'portfolio/buyer' => 'home#buyer_portfolio', as: 'home_buyer_portfolio'

  get 'admins/dashboard'
  get 'admins/index'
  get 'admins/new/user'  => 'admins#new_user',   as: 'admins_new_user'
  post 'admins/new/user' => 'admins#create_user', as: 'admins_create_user'
  get 'admins/view/user/:id' => 'admins#view_user', as: 'admins_view_user'
  get 'admins/edit/user/:id' => 'admins#edit_user', as: 'admins_edit_user'
  put 'admins/edit/user/:id' => 'admins#update_user', as: 'admins_update_user'
  get 'admins/pending' => 'admins#pending_approval', as: 'admins_pending_approval'
  get 'admins/:id/approve'=> 'admins#approve_user', as: 'admins_approve_user'

end
