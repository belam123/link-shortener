Rails.application.routes.draw do
  resources :links
  get "/s/:slug", to: "links#show", as: :short
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
