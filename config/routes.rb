Rails.application.routes.draw do
  devise_for :users, 
  controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :posts do 
    resources :comments, only: [:create, :destroy, :update]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  get '/Myairbnbs', to: 'posts#my_posts', as: 'my_posts'
  get '/Reservations', to: 'reservations#index', as: 'reservations'
  get '/Admin', to: 'posts#admin', as: 'admin'
  get '/cities', to: 'cities#index', as: 'cities'

  
end
