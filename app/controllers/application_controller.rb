class ApplicationController < ActionController::Base
  helper_method :total_spent_calculator
  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :surname, :email, :password, :current_password)
    end
  end

  def total_spent_calculator(id)
    @category = Category.find(id)
    @total_spent = @category.spendings.reduce(0) do |acc, spending|
      acc + spending.amount
    end
  end
end
