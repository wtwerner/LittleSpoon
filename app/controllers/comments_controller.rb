class CommentsController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    before_action :set_comment, only: [:show, :edit, :update, :destroy]

    def edit
        
    end

    def show
        
    end

    def create
        recipe = Recipe.find(params[:recipe_id])
        @comment = recipe.comments.create(comment_params)
        redirect_to recipe_path(recipe)
    end

    def update
        @comment.update(comment_params)
        redirect_to @recipe
    end

    def destroy
        @comment.destroy
        redirect_to @recipe
    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:recipe_id])
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(
            :content, 
            :recipe_id,
            :user_id
        )
    end
end
