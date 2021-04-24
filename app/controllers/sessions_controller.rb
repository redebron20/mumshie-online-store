class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]

    def new
        @user = User.new
    end

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          redirect_to user
        else
          #set error message with flash
          redirect_to '/login', error: "Invalid credentials"
        end
      end
    
      def destroy
        sessions.clear
        redirect_to '/login'
      end

end
