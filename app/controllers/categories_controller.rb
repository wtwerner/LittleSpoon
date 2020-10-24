class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.create(category_params)
        redirect_to categories_path
    end

    private

    def category_params
        params.require(:category).permit(
            :id,
            :user_id,
            :name
        )
    end
end
