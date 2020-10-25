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
        @recipe = Recipe.new(recipe_params)
        
        respond_to do |format|
            if @recipe.save
                format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
                format.json { render :show, status: :created, location: @recipe }
            else
                format.html { render :new }
                format.json { render json: @recipe.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @recipe.update(recipe_params)
                format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.'}
                format.json { render :show, status: :ok, location: @recipe }
            else
                format.html { render :edit }
                format.json { render json: @recipe.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @recipe.destroy
        respond_to do |format|
            format.html { redirect_to recipes_url, notice: 'Recipe was successfully deleted.' }
            format.json { head :no_content }
        end
    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(
            :id,
            :name,
            :favorite,
            :ingredient_recipes_id,
            :category_recipes_id,
            :recipe_id,
            :category_id,
            ingredient: [:id, :name]
        )
    end
end
