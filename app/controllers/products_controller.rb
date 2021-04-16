class ProductsController < ApplicationController
    def index
        @products = Product.all.order(:name)
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
end
