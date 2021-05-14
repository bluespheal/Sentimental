class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.try(:authorized)
      session[:user_id] = user.id
      redirect_to new_textfile_path
    else
      redirect_to login_url, alert: "Email is not authorized"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "Logged out"
  end

end
