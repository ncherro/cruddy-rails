Rails.application.routes.draw do
  resources :posts, :categories, :tags do
    get 'confirm_delete', on: :member
  end
end
