class ApplicationController < ActionController::Base
    include ApplicationHelper

    add_flash_types :success, :error, :warning, :info
    before_action :current_order

    private
    def current_order
        if session[current_order_id]
          order = Order.find_by(:id => session[:order_id])
          if order.present?
            @current_order = order
          else
            session[:order_id] = nil
          end
        end
  
        if session[:order_id] == nil
          @current_order = Order.create
          session[:order_id] = @current_order.id
        end
    end

    # def current_order
    #     if session[:order_id]
    #         @current_order ||= Order.find_by_id(session[:order_id])
    #     else
    #         @current_order = Order.create
    #         session[:order_id] = @current_order.id
    #     end
    # end
end
