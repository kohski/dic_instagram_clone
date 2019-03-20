class PicturesController < ApplicationController
  def new
    unless logged_in?
      redirect_to new_session_path,notice:"Log inしてください。"
    end
    @picture = Picture.new
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
    @picture = Picture.find(params[:id])
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def index
    @pictures = Picture.all
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to pictures_path,notice:"your post was successfully editted"
    else
      render 'edit'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path,notice: "your post is successsfully deleted"
  end


  def picture_params
    params.require(:picture).permit(:title,:comment,:image,:image_cache)
  end

  # def set_picture
  #   Picture.new(params[:id])
  # end

end
