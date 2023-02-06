Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "about" => "homes#about", as: "about"
  get "search" => "searches#search"
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :shops do
    resources :shop_comments, only: [:create, :destroy]
    resource :goods, only: [:create, :destroy]
    resource :bads, only: [:create, :destroy]
  end
end
