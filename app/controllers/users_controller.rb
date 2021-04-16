class UsersController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]

    def new
        @user = User.new
    end

    def create
        @user = User.new(signup_params)
        if @user.id
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        @user = current_user
    end

    private

    def signup_params
        params.require(:user).permit(:email, :username, :password)
    end

end
