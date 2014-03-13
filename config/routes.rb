Pixtr::Application.routes.draw do
  root "galleries#index"

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :galleries do
    resources :images, shallow: true
  end

end
