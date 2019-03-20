class UsersController < ApplicationController
  before_action :set_user,only:[:edit,:update,:show]

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
    unless params[:id] == current_user.id.to_s
      redirect_to pictures_path,notice:"他ユーザーの編集はできません"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice:"user info was successfully editted"
    else
      render "edit"
    end
  end

  def show
    unless params[:id] == current_user.id.to_s
      redirect_to pictures_path,notice:"他ユーザーの情報は閲覧できません。"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:image,:image_cache,:password,:password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
