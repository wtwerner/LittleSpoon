class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]

    def new
        @recipe = Recipe.new
    end

    def index
        @recipes = current_user.recipes.all
    end

    def show
        
    end

    def edit

    end

    def create
        @recipe = Recipe.create(recipe_params)
        redirect_to recipe_path(@recipe)
    end

    def update
        @recipe.update(recipe_params)
        redirect_to @recipe
    end

    def destroy
        @recipe.destroy
        redirect_to recipes_path
    end

    def public
        @recipes = Recipe.all.where(public: true)
    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(
            :name,
            :favorite,
            :public,
            :description,
            :user_id
        )
    end
end
