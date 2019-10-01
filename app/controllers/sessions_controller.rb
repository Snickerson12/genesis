class SessionsController < ApplicationController
  def new
  end

  def create
    p params
    puts "***************************************************"
    @user = User.find_by(name: params[:user][:name])
    p @user
    puts "***************************************************"
    p @user.authenticate(params[:user][:password])
    puts "***************************************************"

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id

    redirect_to login_path
  end

end
