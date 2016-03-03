class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email_address: params[:session][:email_address].downcase)
    if user && user.authenticate(params[:session][:password])
      #log in User
    else
      # create error message
      flash[:danger] = 'Invalid email or password combination!'
      redirect_to login_path
    end

  end

  def destroy
  end
end
