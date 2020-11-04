class CategoriesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    before_action :set_category, only: [:show, :destroy]

    def index
        @categories = current_user.categories.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.create(category_params)
        redirect_to categories_path
    end

    def show
        
    end

    def destroy
        @category.destroy
        respond_to do |format|
            format.html { redirect_to categories_path, notice: 'Category was successfully deleted.' }
            format.json { head :no_content }
        end
    end

    private

    def set_category
        @category = current_user.categories.all.find(params[:id])
    end

    def set_recipe
        @recipe = Recipe.find(params[:recipe_id])
    end

    def category_params
        params.require(:category).permit(
            :id,
            :user_id,
            :name
        )
    end
end
