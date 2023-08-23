class CategoriesController < ApplicationController
    def index
        @categories = current_user.categories
    end

    def new 
    end

    def create 
        category = Category.new(category_params)
        
        if current_user.categories << category
            flash[:notice] = "Category created successfully"
            redirect_to categories_path
        else
            flash.now[:alert] = "Please check your input and try again!"
            render "new"
        end
    end

    private

    def category_params
        params.permit(:name, :icon)
    end
end
