class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def new_spending
    @category = Category.find(params[:category_id])
    @spending = Spending.new
    @categories = current_user.categories
  end

  def create_spending
    @category = Category.find(params[:category_id])
    @categories = current_user.categories
    spending = Spending.new(spending_params)
    if current_user.spendings << spending
      category_spending = CategorySpending.new(category_id: params[:selected_category_id], spending_id: spending.id)

      if category_spending.save
        flash[:notice] = 'Spending created successfully'
        redirect_to category_path(params[:selected_category_id])

      else
        flash.now[:alert] = 'Something went wrong'
        render :new_spending
      end

    else
      flash.now[:alert] = 'Something went wrong'
      render :new_spending
    end
  end

  def show
    @category = Category.find(params[:id])
    @spendings = @category.spendings.reverse
    total_spent_calculator(params[:id])
  end

  def create
    category = Category.new(category_params)

    if current_user.categories << category

      flash[:notice] = 'Category created successfully'
      redirect_to categories_path
    else
      flash.now[:alert] = 'Please check your input and try again!'
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

  def spending_params
    params.require(:spending).permit(:name, :amount)
  end
end
