class ApplicationController < ActionController::Base
    include ApplicationHelper

    add_flash_types :success, :error, :warning, :info
    before_action :current_order

    private
    def current_order
      def current_cart
        if session[:cart_id]
          cart = Cart.find_by(:id => session[:cart_id])
          if cart.present?
            @current_cart = cart
          else
            session[:cart_id] = nil
          end
        end
  
        if session[:cart_id] == nil
          @current_cart = Cart.create
          session[:cart_id] = @current_cart.id
        end
      end
    end

end
