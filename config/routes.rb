Pixtr::Application.routes.draw do
  root "galleries#index"
  resources :galleries do
    resources :images, shallow: true
  end
end
