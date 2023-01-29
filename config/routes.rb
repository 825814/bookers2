Rails.application.routes.draw do
  devise_for :users
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  root to: "homes#top"
  get 'home/about' => "homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
