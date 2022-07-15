class PasswordResetsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(params[:eamil])

    if @user.present?
      # found by App/mailers, rails g mailer Passwor reset
      PasswordMailer.with(user: @user).reset.deliver_now
    end

      redirect_to root_path, notice: "E-mail has been sent, please check your mail box to reset your password"
  end

end 