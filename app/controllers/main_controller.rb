class MainController < ApplicationController

  def index
    if session[:user_id]
      # use find may cause error when there is no such id
      @user = User.find_by(id: session[:user_id])
    end
  end

end