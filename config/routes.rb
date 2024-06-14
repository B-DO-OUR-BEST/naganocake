Rails.application.routes.draw do
  
  scope module: :public do
    devise_for :users, controllers: {
      registrations: 'registrations',
      sessions: 'sessions',
    resource :homes, only: [:top,:about]
    resources :items, only: [:index,:show]
    resource :customers, only: [:show,:edit,:update]
      member do
        get :unsubscribe
        get :withdraw
      end
    resources :cart_items, only: [:index,:update,:create,:destroy]
      member do
        get :destroy_all
      end
    resources :orders, only: [:new,:create,:index,:show]
      member do
        get :confirm
        get :thanks
      end
    resources :addresses, only: [:index, edit, create, update, destroy]  
  end

  namespace :admin do
    devise_for :admins, controllers: {
      sessions: 'sessions',
    resource :homes,only: [:top]
    resources :items, only: [:index,:new,:create,:show,:edit,:update]
    resources :genres,only: [:index,:create,:edit,:update]
    resources :customers,only: [:index,:show,:edit,:update]
    resources :orders,only: [:show,:update]
    resources :order_details,only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
