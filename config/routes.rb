Rails.application.routes.draw do
  resources :posts, :categories, :tags
end
