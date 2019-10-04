class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    elsif @user
      flash[:errors] = @user.errors.full_messages
      redirect_to login_path 
    else
      flash[:errors] = ["Please enter valid credentials"]
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    
    redirect_to login_path
  end

end
