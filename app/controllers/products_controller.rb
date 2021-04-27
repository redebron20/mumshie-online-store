class ProductsController < ApplicationController
    before_action :find_product, only: :show
    
    def index
        if params[:category].blank?
            @product = Product.all.order(params[:sort])
        else
            @category_id = Category.find_by(name: params[:category]).id
            if params[:sort]
                @product = Product.where(category_id: @category_id).order(params[:sort])
            else
                @product = Product.where(category_id: @category_id).order("created_at ASC")
            end
            @category = Category.find(@category_id)
         end
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
