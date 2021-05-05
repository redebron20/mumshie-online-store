class CategoriesController < ApplicationController
    

    def index
        @categories = Category.alpha
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

    def edit
        if logged_in?
            @category = Category.find_by(id: params[:id])
        else
            redirect_to category_path(@category)
        end
    end

    def update
        @category.update(category_params)
        if @category.valid?
            redirect_to @category
        else
            render :edit
        end
    end

    def destroy
        if @category.destroy
            redirect_to categories_path
        else
            redirect_to @category
        end
    end

    private

    def category_params
        params.require(:category).permit(:name, :decription)
    end
end
