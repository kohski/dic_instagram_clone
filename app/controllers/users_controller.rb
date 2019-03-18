class UsersController < ApplicationController
  def new
  end

  def edit
  end

  def show
  end

  private

  def user_params
    params.require(:user).poermit(:name,:email,:image)
  end


  
end
