Pixtr::Application.routes.draw do
  root "homes#show"
  resource :dashboard, only: [:show]

  resources :galleries do
    member do
      post "like" => "gallery_likes#create"
      delete "dislike" => "gallery_likes#destroy"
    end
    resources :images, only: [:new, :create]
  end

  resources :groups, only: [:index, :new, :create, :show] do
    member do
      post "join" => "group_memberships#create"
      delete "leave" => "group_memberships#destroy"
      post "like" => "group_likes#create"
      delete "dislike" => "group_likes#destroy"
    end
  end

  resource :search, only: [:show]

  resources :tags, only: [:show, :create]

  resources :images, except: [:index, :new, :create] do
    member do
      post "like" => "image_likes#create"
      delete "dislike" => "image_likes#destroy"
    end
    resources :comments, only: [:create]
    resources :tags, only: [:create]
  end

  resources :comments, only: [:edit, :update, :destroy] do
    member do
      post "like" => "comment_likes#create"
      delete "dislike" => "comment_likes#destroy"
    end
  end

  resources :users, only: [:show, :index] do
    member do
      post "follow" => "following_relationships#create"
      delete "unfollow" => "following_relationships#destroy"
    end
  end
  
end
