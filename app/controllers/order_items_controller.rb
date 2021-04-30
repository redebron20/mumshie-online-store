class OrderItemsController < ApplicationController
    def create
        # Find associated product and current order
        chosen_product = Product.find(params[:product_id])
        current_order = @current_order
      
        # If order already has this product then find the relevant order_item and iterate quantity otherwise create a new order_item for this product
        if current_order.products.include?(chosen_product)
          # Find the order_item with the chosen_product
          @order_item = current_order.order_items.find_by(:product_id => chosen_product)
          # Iterate the order_item's quantity by one
          @order_item.quantity += 1
        else
          @order_item = orderItem.new
          @order_item.order = current_order
          @order_item.product = chosen_product
        end
      
        # Save and redirect to order show path
        @order_item.save
        redirect_to order_path(current_order)
      end
      
      private
        def order_item_params
          params.require(:order_item).permit(:quantity,:product_id, :order_id)
        end
end
