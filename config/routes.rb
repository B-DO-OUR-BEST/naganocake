Rails.application.routes.draw do
  
  scope module: :public do
    
    resource :homes, only: [:top,:about] 
    resources :items, only: [:index,:show]
    resource :customers, only: [:show,:edit,:update] do
      member do
        get :unsubscribe
        get :withdraw
      end
    end
    resources :cart_items, only: [:index,:update,:create,:destroy] do
      member do
        get :destroy_all
      end
    end
    resources :orders, only: [:new,:create,:index,:show] do
      member do
        get :confirm
        get :thanks
      end 
    end
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]  
  end

  namespace :admin do
    
    resource :homes, only: [:top]
    resources :items, only: [:index,:new,:create,:show,:edit,:update]
    resources :genres, only: [:index,:create,:edit,:update]
    resources :customers, only: [:index,:show,:edit,:update]
    resources :orders, only: [:show,:update]
    resources :order_details, only: [:update]
  end
  devise_for :customers, controllers: {
      registrations: 'public/registrations',
      sessions: 'public/sessions',
    }
  devise_for :admins, controllers: {
      sessions: 'admin/sessions',
    }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
