class StepsController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    before_action :set_step, only: [:show, :edit, :update, :destroy]

    def edit
        
    end

    def show
        
    end

    def create
        recipe = Recipe.find(params[:recipe_id])
        @step = recipe.steps.create(step_params)
        redirect_to recipe_path(recipe)
    end

    def update
        @step.update(ingredient_params)
        redirect_to @recipe
    end

    def destroy
        @step.destroy
        redirect_to @recipe
    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:recipe_id])
    end

    def set_step
        @step = Step.find(params[:id])
    end

    def step_params
        params.require(:step).permit(
            :description, 
            :recipe_id
        )
    end
end
