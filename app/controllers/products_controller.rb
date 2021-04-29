class ProductsController < ApplicationController
    before_action :find_product, only: [:show, :edit, :update, :destroy]
    
    def index
        if params["search"]
            @products = Product.search_by_name(params["search"])
        elsif params[:category_id] && @category = Category.find(params[:category_id])
            @products = @category.products
        else
            @products = Product.all
        end
    end

    def show
        find_product
    end

    def new  
        if params[:category_id] && @category = Category.find_by(params[:category_id])
            @product = Product.new(category_id: params[:category_id])
        else
            @product = Product.new
            build_category
        end   
    end

    def create
        @product = Product.new(product_params)
        @category = Category.find(params[:category_id]) if params[:category_id]
        
        if @product.save
            redirect_to @product
        else
            build_category
            render :new
        end
    end

    def edit
    end

    def update
        @product.update(product_params)
        if @product.valid?
            redirect_to @product
        else
            build_category
            render :edit
        end
    end

    def destroy
        if @product.destroy
            redirect_to products_path
        else
            redirect_to back
        end
    end


    private

    def product_params
        params.require(:product).permit(:name, :description, :availability, :price, :category_id, category_attributes: [:name, :description])
    end

    def build_category
        @product.build_category
    end

    def find_product
        @product = Product.find_by_id(params[:id])
    end

end
