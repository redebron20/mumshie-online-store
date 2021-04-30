class OrdersController < ApplicationController
    before_action :find_order, only: [:new, :show, :edit]

    def index
      @orders = Order.all
    end
    
    def show
      current_order
    end
    
    def new
      @order = Order.new
    end

    def create
      @order = current_user.orders.build(order_params)

      if @order.save
        redirect_to @order
      else
        render :new
      end
    end

    def destroy
      @order = @current_order
      @order.destroy
      session[:order_id] = nil
      redirect_to root_path
    end

    private

    def order_params
      params.require(:order).permit(:total)
    end

    def find_order
      if current_user
        @order = current_user.orders.find(params[:order_id])
      elsif !session[:order_id].nil?
        @order = Order.find(session[:order_id])
      else
        redirect_to root_path
      end
  
      rescue ActiveRecord::RecordNotFound
    end

end
