class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(params[:photo_params])
    @photo.the_photo = params[:photo][:the_photo]
    @photo.user_id = current_user.id
    if @photo.save
      flash[:notice] = "The photo has been uploaded"
      redirect_to photo_path(@photo.id )
    else
      render "new"
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def index
    @photos = Photo.all.order(:user_id)
  end

  def edit
    @photo = Photo.find(params[:id])
    if current_user.id != @photo.user_id
      flash[:alert] = "You may only edit your own photos"
      redirect_to photo_path(@photo)
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if current_user.id != @photo.user_id
      flash[:alert] = "You may only edit your own photos"
      redirect_to photo_path(@photo)
    end
    if @photo.update(:the_photo => params[:photo][:the_photo])
      flash[:notice] = "Photo updated"
      redirect_to photos_path
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if current_user.id != @photo.user_id
      flash[:alert] = "You may only edit your own photos"
      redirect_to photo_path(@photo)
    else
      @photo.destroy
      flash[:notice] = "Photo deleted"
      redirect_to photos_path
    end
  end


end
