class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user_params])
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "Your account was created"
      redirect_to root_url
    else
      render "new"
    end
  end

  def show
    @user = User.find(session[:user_id])
    @tags = Tag.where(:user_id => @user.id).order(:photo_id)
    render "show"
  end

end
