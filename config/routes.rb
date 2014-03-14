Pixtr::Application.routes.draw do
  root "homes#show"
  resources :galleries do
    resources :images, shallow: true
  end
end
