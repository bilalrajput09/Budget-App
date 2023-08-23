class CategoriesController < ApplicationController
    def index
        @categories = current_user.categories
    end

    def new 
    end

    def new_spending
    end

    def create_spending
        spending = Spending.new(spending_params)
        if current_user.spendings << spending
            flash[:notice] = "Spending created successfully"
            redirect_to categories_path
        else
            flash.now[:alert] = "Something went wrong"
            render "new_spending"
        end
    end

    def show
        @category = Category.find(params[:id])
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

    def spending_params
        params.permit(:name, :amount)
    end
end
