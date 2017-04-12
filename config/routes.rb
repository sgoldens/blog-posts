Rails.application.routes.draw do
  resources :posts
  post "/signup"        => "users#create"
  get "/posts"          => "posts#index"
  get "/posts/:id"          => "posts#show"
  post "/current_user/:token"          => "api#current_user"
  delete "/posts/:id"   => "posts#destroy"
  put "/posts/edit/:id"   => "posts#edit"
  get "/posts/edit/:id"   => "posts#show"

  scope :format => true, :constraints => { :format => 'json' } do
    post   "/login"       => "sessions#create"
    delete "/logout"      => "sessions#destroy"
  end

  root "posts#index"
end