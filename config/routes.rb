Pixtr::Application.routes.draw do
  root "galleries#index"
  get "/galleries/new" => "galleries#new"
  get "/galleries/:id" => "galleries#show", as: :gallery
  get "/galleries/:id/edit" => "galleries#edit"
  patch "/galleries/:id" => "galleries#update"
  post "/galleries" => "galleries#create"
  delete "/galleries/:id" => "galleries#destroy"
end
