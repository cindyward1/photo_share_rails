class SessionsController < ApplicationController
  def new
    session[:user_id] = nil
    @user = User.new
  end

  def create
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "You are now logged in"
      redirect_to new_photo_path
    else
      flash[:alert] = "Email or password not found"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are now logged out"
    redirect_to root_url
  end
end
