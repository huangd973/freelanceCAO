Rails.application.routes.draw do

  devise_for :users
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
  
  root "home#index"
  get "home", to: "home#index"

  get "projects/:id", to: "projects#show", as: 'project'
  get "projects", to: "projects#index"
  get "home/new", to: "projects#new"
  post "projects", to: "projects#create"
  get "/projects/:id/edit", to: "projects#edit", as: "edit_project"
  patch "/projects/:id", to: "projects#update"
  delete "/projects/:id", to: "projects#destroy"
  resources :projects, param: :identifier do
    resources :comments, :defaults => { :format => 'html' }, only: :create
  end
end
