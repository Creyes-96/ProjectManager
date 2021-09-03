class RegistrationsController < Devise::RegistrationsController
    skip_before_action :require_no_authentication, only: [:new, :create]
    
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to registrations_path
        else
            render :new 
        end 
    end

    def edit
        puts params, "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
        @user = User.find(params[:id])
    end

    def update
        puts params, "uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu"
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to registrations_path
        else
            render :edit 
        end 
    end

    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :privilege)
        end
        
end
