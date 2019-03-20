class PicturesController < ApplicationController
  before_action :set_picture, only:[:show,:edit,:update,:destroy]

  def new
    unless logged_in?
      redirect_to new_session_path,notice:"Log inしてください。"
    end

    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render 'new' if @picture.invalid?
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to pictures_path,notice:"投稿しました"
    else
      render 'new'
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def index
    @pictures = Picture.all
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path,notice:"your post was successfully editted"
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path,notice: "your post is successsfully deleted"
  end

  private

  def picture_params
    params.require(:picture).permit(:title,:comment,:image,:image_cache,:user_id)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

end
