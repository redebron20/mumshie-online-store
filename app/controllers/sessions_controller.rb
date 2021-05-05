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
          flash[:error] = user.errors.full_messages.to_sentence
          redirect_to '/login'
        end
      end

      def omniauth
        user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
          u.username = request.env['omniauth.auth'][:info][:name]
          u.email = request.env['omniauth.auth'][:info][:email]
          u.password = SecureRandom.hex(16)
        end 
        if user.valid?
          session[:user_id] = user.id
          redirect_to user
        else
          redirect_to login_path 
        end 
      end 

      def destroy
        session.delete(:user_id) if session[:user_id]
        flash[:notice] = "Signed out"
        redirect_to root_path
      end

end
