class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to pictures_path,notice:"ログインしました。"
    else
      flash[:notice] = "log inに失敗しました"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path,notice:"log outしました"
  end
end
