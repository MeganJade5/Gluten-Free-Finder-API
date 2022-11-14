Rails.application.routes.draw do
  # admin
  get 'admin', to: 'admin#index'
  get 'admin/posts'
  get 'admin/show_post'

  get "/cuisines", to: "cuisines#index", as: "cuisines"
  get "/food_preps", to: "food_preps#index", as: "food_preps"
  get "/posts", to: "posts#index", as: "posts"
  post "/posts", to: "posts#create"
  get "/posts/:id", to: "posts#show", as: "post"
  put "/posts/:id", to: "posts#update"
  patch "/posts/:id", to: "posts#update"
  delete "/posts/:id", to: "posts#destroy"
  post "/auth/signin", to: "auth#signin", as: "signin"
  post "/auth/signup", to: "auth#signup", as: "signup"
end
