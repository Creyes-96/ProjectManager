Rails.application.routes.draw do
    resources :teams
    namespace :user do
        resources :notes
    end
    devise_for :users
    get 'home/index'
    
    resources :projects do 

        scope module: :project do
            #projects/1/phases/new
            resources :phases do
                scope module: :phase do
                    resources :milestones
                    resources :activities
                end
            end 

        end
        #projects/:id/phases/:id/milestones
    end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: "home#index"
end
