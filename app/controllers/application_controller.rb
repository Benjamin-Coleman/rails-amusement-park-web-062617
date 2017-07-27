class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :is_admin, :logged_in


  def current_user
  	@current_user ||= User.find_by(id: session[:user_id])
  end

  def is_admin
  	if current_user.admin 
  		true
  	else
  		flash[:message] = "You do not have permission for that action"
  		redirect_to attractions_path
  	end
  end

  def logged_in
    if !!current_user
      puts 'logged in'
    else
      redirect_to '/'
    end
  end

end
