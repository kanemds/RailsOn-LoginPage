class ApplicationController < ActionController::Base
  #before make any request in App run :set_current_user first
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
    # use find may cause error when there is no such id
      Current.user = User.find_by(id: session[:user_id])
    end
  end
end
