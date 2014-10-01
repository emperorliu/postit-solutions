PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  # get '/posts', to: 'posts#index'
  # get '/posts/:id', to: 'posts#show'
  # get '/posts/new', to: 'posts#new'
  # post '/posts', to: 'posts#create'
  # get '/posts/:id/edit', to:'posts#edit'
  # patch '/posts/:id', to: 'posts#update'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/register', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update]

  resources :posts, except: [:destroy] do

    member do
      post :vote
    end

    resources :comments, only: [:create, :show] do
      member do
        post :vote
      end
    end
  end

  resources :categories, only: [:create, :show, :new]
end