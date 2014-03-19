Pixtr::Application.routes.draw do
  root "homes#show"
  resources :galleries do
    resources :images, only: [:new, :create]
  end

  resources :groups, only: [:index, :new, :create, :show]

  resources :images, except: [:index, :new, :create] do
    resources :comments, only: [:create]
  end

  resources :users, only: [:show, :index]
  
end
