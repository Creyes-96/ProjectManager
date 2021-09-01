Rails.application.routes.draw do
    devise_for :users,
    controllers: {:registrations => "registrations"}

    as :user do
        get "/registrations", to: "registrations#index"
        get "/registrations/new", to: "registrations#new"
        post "/registrations", to: "registrations#create"
    end
    resources :teams
    

    get 'home/index'
    
    resources :projects do 
        
        scope module: :project do
            #projects/1/phases/new
            resources :phases do
                scope module: :phase do
                    resources :activities
                    resources :milestones do
                        scope module: :milestone do
                            resources :notes
                        end
                    end
                end
            end 
            
        end
        #projects/:id/phases/:id/milestones
    end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: "home#index"
end
