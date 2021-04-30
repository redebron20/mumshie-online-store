class OrdersController < ApplicationController

    def index
      @orders = Order.all
    end
    
    def show
      @order = Order.find(params[:id])
    end
    
    def new
      @order = Order.new
    end

    def create
      @order = Order.new
      @current_cart.order_items.each do |item|
        @order.order_items << item
        item.cart_id = nil
      end
      
      @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_path
    end

    def destroy
      @order = @current_order
      @order.destroy
      session[:order_id] = nil
      redirect_to root_path
    end

end
