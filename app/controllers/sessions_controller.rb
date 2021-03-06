class SessionsController < ApplicationController
  skip_before_filter :require_login
  
  def new
  end
  
  def welcome
  	if session[:user_id] != nil
  	  redirect_to home_path
  	end
  end
  
  def create
  	user = User.authenticate(params[:username], params[:password])
  	if user
      if user.active?
    	  session[:user_id] = user.id
        session[:user_role] = user.role
    	  redirect_to home_path
      else
        redirect_to inactive_path
      end
  	else
  	  flash.now.alert = "invalid username/password"
  	  render "new"
  	end
  end
	
  def destroy
  	session[:user_id] = nil
    session[:user_role] = nil
  	redirect_to root_url, :notice => "you've been logged out"
  end
  
end
