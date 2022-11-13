Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/cuisines", to: "cuisines#index", as: "cuisines"
  get "/food_preps", to: "food_preps#index", as: "food_preps"
  get "/posts", to: "posts#index", as: "posts"
  get "/posts/:id", to: "posts#show", as: "post"
  post "/auth/signin", to: "auth#signin", as: "signin"
  post "/auth/signup", to: "auth#signup", as: "signup"


  # authenticated :user, ->(user) {user.admin? } do
  #   get 'admin', to: 'admin#index'
  #   get 'admin/posts'
  #   get 'admin/show_post'
  # end
end
