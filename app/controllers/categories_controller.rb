class CategoriesController < ApplicationController

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
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

    def edit
        @category = Category.find_by(id: params[:id])
    end

    def update
        @category.update(category_params)
        if @category.valid?
            redirect_to @category
        else
            render :edit
        end

    end

    private

    def category_params
        params.require(:category).permit(:name, :decription)
    end
end
