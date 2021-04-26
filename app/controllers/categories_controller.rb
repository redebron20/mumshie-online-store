class CategoriesController < ApplicationController

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
        @category.products.build
    end

    def create
        @category = Category.create(category_params)
        if @category.valid?
            redirect_to @category
        else
            @category.products.build
            render :new
        end
    end

    def show
        @category = Category.find_by(id: params[:id])
    end

    private

    def category_params
        params.require(:category).permit(:name, :decription)
    end
end
