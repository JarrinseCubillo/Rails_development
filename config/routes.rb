Rails.application.routes.draw do
  post "/login", to: "sessions#create", as: "new_user_session"
  get "/login", to: "sessions#login", as: "login"
  delete '/logout', to: "sessions#destroy", as: 'logout'

  post "/signup", to: "users#create", as: "new_user_registration"
  get "/signup", to: "users#new", as: "signup"
  
  delete "/article/:id", to: "articles#destroy", as: "article_destroy"
  patch "/article/:id", to: "articles#update"
  get "/article/:id/edit", to: "articles#edit", as: "article_edit"
  get "/article/:id", to: "articles#show", as: "article"
  get "/articles/new", to: "articles#new"
  post "/articles", to: "articles#create"
  get "/articles", to: "articles#index"
  
  root 'pages#home'
end
