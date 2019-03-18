class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def confirm
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      ContactMailer.contact_mail(@user).deliver
      redirect_to user_path(id:@user.id), notice: "sign up"
    else
      render 'new'
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice:"user info was successfully editted"
    else
      render "edit"
    end

  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:image,:image_cache,:password,:password_confirmation)
  end


  
end
