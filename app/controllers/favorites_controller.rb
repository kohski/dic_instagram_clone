class FavoritesController < ApplicationController

  def index
    if logged_in?
      @favorites = Favorite.where(user_id: current_user.id)
    else
      redirect_to new_session_path,notice:"ログインしてください"
    end
  end

  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_url, notice:"#{favorite.user.name}さんの記事をお気に入り登録完了"
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy
    redirect_to pictures_url, notice:"#{favorite.user.name}さんの記事をお気に入り解除完了"
  end

end
