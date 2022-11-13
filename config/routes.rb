Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/cuisines", to: "cuisines#index", as: "cuisines"
  get "/food_preps", to: "food_preps#index", as: "food_preps"
  get "/posts", to: "posts#index", as: "posts"
end
