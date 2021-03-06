Rails.application.routes.draw do
  #namespace :project do
    #resources :teams
  #end
  devise_for :users,
  controllers: {:registrations => "registrations"}

  
    as :user do
        get "/registrations", to: "registrations#index"
        get "/registrations/new", to: "registrations#new"
        post "/registrations", to: "registrations#create"
        #get "/registration/:id", to: "registrations#show", as: "registration"
        #get "/registrations/:id/edit", to: "registrations#edit", as: "edit_registration"
        #patch "/registration/:id", to: "registrations#update"
        #put "/registration/:id", to: "registrations#update"
    end

    get 'home/index'
    
    resources :projects do 
        
        scope module: :project do
            #projects/1/phases/new
            resources :teams
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
