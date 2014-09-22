class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(params[:photo_params])
    @photo.the_photo = params[:photo][:the_photo]
    @photo.user_id = current_user.id
    if @photo.save
      params[:photo][:user_id].each do |user_id|
        if user_id != ""
          tagged_user = User.find(user_id)
          new_tag = Tag.create(:user_id => user_id, :photo_id => @photo.id)
        end
      end
      flash[:notice] = "The photo has been uploaded"
      redirect_to photo_path(@photo.id )
    else
      render "new"
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @tagged_users = @photo.users
  end

  def index
    @photos = Photo.all.order(:user_id)
    @tags = Tag.all
  end

  def edit
    @photo = Photo.find(params[:id])
    @tagged_users = @photo.users
    if current_user.id != @photo.user_id
      redirect_to photo_path(@photo)
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if current_user.id != @photo.user_id
      flash[:alert] = "You may only edit your own photos"
      redirect_to photo_path(@photo)
    else
      @photo.tags.destroy_all
      if !params[:photo][:user_id].empty? && params[:photo][:user_id].last != ""
        params[:photo][:user_id].each do |user_id|
          if user_id != ""
            tagged_user = User.find(user_id)
            new_tag = Tag.create(:user_id => user_id, :photo_id => @photo.id)
            flash[:notice] = "Photo tagged"
          end
        end
      end
      if !params[:photo][:the_photo].nil?
        if @photo.update(:the_photo => params[:photo][:the_photo])
          flash[:notice] = flash[:notice] + " and updated"
          redirect_to photos_path
        else
          render 'edit'
        end
      else
        redirect_to photos_path
      end
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
