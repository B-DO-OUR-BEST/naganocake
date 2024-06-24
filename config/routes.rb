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
    get "/about" => "homes#about"

    get '/customers/my_page', to: 'customers#show'
    patch '/customers/my_page', to: 'customers#show'

    get '/customers/information/edit', to: 'customers#edit'
    patch '/customers/information/edit', to: 'customers#edit'
  
    get 'search', to: 'search#index', as: :search

    resources :items, only: [:index, :show]

    
      resources :customers do
        member do
          get "unsubscribe"
          patch "withdraw"
          get 'information/edit', to: 'customers#edit'
          patch :information, to: 'customers#update'
        end
        collection do
          get :my_page
        end
      end
      resources :cart_items, only: [:index, :update, :create, :destroy] do
        collection do
          delete :destroy_all
        end
      end
      resources :orders, only: [:new, :create, :index, :show] do
        collection do
          post :confirm
          get :thanks
        end
      end
      resources :addresses, only: [:index, :edit, :create, :update, :destroy]

      resources :genres, only: [:show]
    

    namespace :admin do
      get '/' => 'homes#top'
      resources :items, only: [:index, :new, :create, :show, :edit, :update]
      resources :genres, only: [:index, :create, :edit, :update]
      resources :customers, only: [:index, :show, :edit, :update]
      resources :orders, only: [:show, :update, :index]
      resources :order_details, only: [:update]
    end
  end
end

