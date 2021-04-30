class OrderItemsController < ApplicationController
    def create
        @order = current_order
        @order_item = @order.order_items.new(order_item_params)
        existing_order = @order.order_items.where(product_id: params[:order_item][:product_id])
        if existing_order.count >= 1
          existing_order.last.update_column(:quantity, existing_order.last.quantity + params[:order_item][:quantity].to_i)
        else
          @order.save
        end
        session[:order_id] = @order.id
      end
    
      def update
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.update_attributes(order_item_params)
        @order_items = @order.order_items
      end
    
      def destroy
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.destroy
        @order_items = @order.order_items
      end
    
      private
    
      def order_item_params
        params.require(:order_item).permit(:quantity, :product_id)
      end
end
