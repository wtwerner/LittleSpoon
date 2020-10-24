class IngredientsController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

    def edit
        
    end

    def create
        @recipe = Recipe.find(params[:recipe_id])
        @ingredient = @recipe.ingredients.create(ingredient_params)
        redirect_to recipe_path(@recipe)
    end

    def update
        respond_to do |format|
            if @ingredient.update(ingredient_params)
                format.html { redirect_to @recipe, notice: 'Ingredient was successfully updated.'}
                format.json { render :show, status: :ok, location: @recipe }
            else
                format.html { render :edit }
                format.json { render json: @ingredient.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @ingredient.destroy
        respond_to do |format|
            format.html { redirect_to @recipe, notice: 'Ingredient was successfully deleted.' }
            format.json { head :no_content }
        end
    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:recipe_id])
    end

    def set_ingredient
        @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
        params.require(:ingredient).permit(
            :name, 
            :quantity,
            :unit,
            :recipe_id
        )
    end
end
