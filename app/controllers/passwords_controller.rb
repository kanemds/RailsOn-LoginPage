class PasswordsController < ApplicationController
  
  #method was created at application so all the controller can be used

  before_action :require_user_logged_in!


  def edit
  end

  def update
    if  Current.user.update(password_params)
     redirect_to root_path, notice: "Password Updated"
    else
      render :edit
    end 
  end


   private

   def password_params
    params.require(:user).permit(:password, :password_confirmatioin)
   end
  
end