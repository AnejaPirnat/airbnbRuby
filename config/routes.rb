Rails.application.routes.draw do
  devise_for :users, 
  controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :posts do 
    resources :comments, only: [:create, :destroy, :update]
  end

  resources :reservations, only: [:create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  get '/Myrentals', to: 'posts#my_posts', as: 'my_posts'
  get '/Admin', to: 'posts#admin', as: 'admin'
  get '/cities', to: 'cities#index', as: 'cities'
  get '/reservations', to: 'reservations#index', as: 'my_reservations'
  get '/Villas', to: 'posts#index', category: 1, as: 'villas'
  get '/Apartments', to: 'posts#index', category: 3, as: 'apartments'
  get '/Cottages', to: 'posts#index', category: 2, as: 'cottages'
  get '/Rooms', to: 'posts#index', category: 4, as: 'rooms'
end
