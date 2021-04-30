class ApplicationController < ActionController::Base
    add_flash_types :success, :error, :warning, :info
    include ApplicationHelper

    def current_order
        if current_user
          if current_user.orders.exists?(user_id: current_user.id)
            Order.where(user_id: current_user.id).last
          else
            Order.new(user_id: current_user.id)
          end
        elsif !session[:order_id].nil?
          Order.find(session[:order_id])
        else
          Order.new
        end
      end
end
