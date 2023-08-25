class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:welcome]
  def welcome
    return unless current_user

    redirect_to categories_path
  end
end
