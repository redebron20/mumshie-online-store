class ProductsController < ApplicationController
    before_action :find_product, only: :show
    
    def index
        @products = Product.all
    end

    def show
        find_product
    end

    def new
        if params[:category_id] && @category = Category.find(params[:category_id])
            @product = Product.new(category_id: params[:category_id])
        else
            @product = Product.new
            build_category
        end   
    end

    def create
        @product = Product.new(product_params)
        if @product.save

        else

        end

    end

    private

    def find_product
        @product = Product.find_by_id(params[:id])
    end

    def product_params
        params.require(:product).permit(:name, :description, :availability, :price
        )
    end

    def build_category
        @product.build_category
    end

end
