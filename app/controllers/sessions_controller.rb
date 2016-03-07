class SessionsController < ApplicationController
  def new
  end

  # Create a new user session when the user logs in
  def create
    user = User.find_by(email_address: params[:session][:email_address].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_path
    else
      # create error message
      flash[:danger] = 'Invalid email or password combination!'
      redirect_to login_path
    end
  end

  # Destroy the logged in user session
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
