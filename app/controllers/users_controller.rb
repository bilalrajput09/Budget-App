class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:welcome]
  def welcome
    if current_user
      redirect_to categories_path
    end
  end
end
