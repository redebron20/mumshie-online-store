class SessionsController < ApplicationController
    #before_action :redirect_if_logged_in, only: [:new]

    def new
        @user = User.new
    end

    def create
     
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          redirect_to user
        else
          flash.now[:error] = @user.errors.full_messages.to_sentence
          redirect_to '/login'
        end
      end
    
      def destroy
        session.delete(:current_user_id) if session[:current_user_id]
        flash[:notice] = "Signed out"
        redirect_to root_path
      end

end
