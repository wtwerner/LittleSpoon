class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    before_action :redirect_cancel, only: [:create, :update]

    def new
        @recipe = Recipe.new
        @categories = Category.all
    end

    def index
        @recipes = current_user.recipes.all
    end

    def show
        
    end

    def edit

    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.valid?
            @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :new
        end
    end

    def update
        @recipe.assign_attributes(recipe_params)
        if @recipe.valid?
            @recipe.save
            redirect_to @recipe
        else
            render :edit
        end
    end

    def destroy
        @recipe.destroy
        redirect_to recipes_path
    end

    def public
        @recipes = Recipe.all.where(public: true).where.not(user_id: current_user.id)
    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def redirect_cancel
        redirect_to recipes_path if params[:cancel]
    end

    def recipe_params
        params.require(:recipe).permit(
            :name,
            :favorite,
            :public,
            :description,
            :user_id,
            category_ids:[]
        )
    end
end
