Rails.application.routes.draw do
  resources :teams
  namespace :user do
    resources :notes
  end
  devise_for :users
  get 'home/index'
  namespace :project do
    namespace :phase do
      resources :milestones
    end
  end
  namespace :project do
    namespace :phase do
      resources :activities
    end
  end
  namespace :project do
    resources :phases
  end
  resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
