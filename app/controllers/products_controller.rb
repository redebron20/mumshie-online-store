class ProductsController < ApplicationController
    before_action :find_product, only: :show
    
    def index
        @products = Product.all
    end

    def show
        find_product
    end

    def new
        if params[:category_id] && @category = Category.find_by(params[:category_id])
            @product = Product.new(category_id: params[:category_id])
        else
            @category_id = params[:product][:category_id]
            @product = product
            render :new
        end   
    end

    def create
        @product = Product.new(product_params)
        @category = Category.find(params[:category_id]) if params[:category_id]
        
        if @product.save
            redirect_to @product
        else
            build_category
            render :edit
        end
    end

    def edit
        build_category
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
