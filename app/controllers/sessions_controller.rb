class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email] )
    # authenticate method come from user model in rails
    # checking if the user exist and password is matched
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
   else
    flash[:alert] = "Invalid email or password"
    render :new
   end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end

end