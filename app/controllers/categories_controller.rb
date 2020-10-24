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

    def show
        @category = Category.find(params[:id])
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        respond_to do |format|
            format.html { redirect_to categories_path, notice: 'Category was successfully deleted.' }
            format.json { head :no_content }
        end
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
