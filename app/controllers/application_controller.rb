class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    if session[:user_id]
     @user = User.find(session[:user_id])
   else
     session[:user_id] = nil
     nil
   end
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
  end
  #
  def hello
    redirect_to controller: 'sessions', action: 'new' unless session[:name]
  end

end
