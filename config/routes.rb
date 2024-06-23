Rails.application.routes.draw do

  devise_for :customers, controllers: {
      registrations: 'public/registrations',
      sessions: 'public/sessions',
  }

  devise_for :admin, controllers: {
      sessions: 'admin/sessions',
  }

  get 'search/index'

  scope module: :public do

  root "homes#top"
  get "/about"=>"homes#about"

  get '/customers/my_page', to: 'customers#show'

  #追加
  get 'search', to: 'search#index', as: :search

  # get "login", to: "sessions#new"
  # post "login", to: "sessions#create"
  # delete "logout", to: "sessions#destroy"

    resources :items, only: [:index,:show]
    resource :customers do
      member do
        get :unsubscribe
        get :withdraw
        get 'information/edit', to: 'customers#edit'
        patch :information, to: 'customers#update'
      end
      collection do
        get :my_page
      end
    end
    resources :cart_items, only: [:index,:update,:create,:destroy] do
      collection do
        delete :destroy_all
      end
    end
    resources :orders, only: [:new,:create,:index,:show] do
      collection do
        post :confirm
        get :thanks
      end
    end
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    resources :genres, only: [:show]

  end

  namespace :admin do

    # resource :homes, only: [:top]
    root 'homes#top'
    resources :items, only: [:index,:new,:create,:show,:edit,:update]
    resources :genres, only: [:index,:create,:edit,:update]
    resources :customers, only: [:index,:show,:edit,:update]
    resources :orders, only: [:show,:update]
    resources :order_details, only: [:update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end