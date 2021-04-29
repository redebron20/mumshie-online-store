class UsersController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(signup_params)
        if @user.id
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        byebug
        @user = current_user
    end

    private

    def signup_params
        params.require(:user).permit(:email, :username, :password)
    end

end
