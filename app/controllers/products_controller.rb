class ProductsController < ApplicationController
    before_action :find_product, only: :show
    
    def index
        @products = Product.all
    end

    def show
        find_product
    end

    def new
        @product = Product.new
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

    
end
