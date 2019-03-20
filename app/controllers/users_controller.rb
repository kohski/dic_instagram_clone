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
      redirect_to new_session_path, notice: "sign upしました。log inしてください。"
    else
      render 'new'
    end
  end

  def edit
    if params[:id] == current_user.id.to_s
      @user = User.find(params[:id])
    else
      redirect_to pictures_path,notice:"他ユーザーの編集はできません"
    end
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
    if params[:id] == current_user.id.to_s
      @user = User.find(params[:id])
    else
      redirect_to pictures_path,notice:"他ユーザーの情報は閲覧できません。"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:image,:image_cache,:password,:password_confirmation)
  end
  
end
