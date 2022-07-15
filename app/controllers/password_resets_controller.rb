class PasswordResetsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      # found by App/mailers, rails g mailer Passwor reset
      PasswordMailer.with(user: @user).reset.deliver_now
    end

      redirect_to root_path, notice: "E-mail has been sent, please check your mail box to reset your password"
  end


  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: "The password reset request is expired, please try again."
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")

    if @user.update(password_params)

      redirect_to sign_in_path, notice: "Password reset successfully!"
    else
      render :edit
    end
  end

  private
    
    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end

end 