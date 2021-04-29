module ApplicationHelper

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end
    
    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?
    end

    def redirect_if_logged_in
        redirect_to products_path if logged_in?
    end
    
    def conditional_errors(object)
        render partial: "products/errors", locals: {object: object} if object.errors.any?
    end


end
