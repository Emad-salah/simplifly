class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception

  def authenticate
    @user = API.authenticate(token: cookies[:token])
    if !@user
      redirect_to new_authentication_path
    end
  end
end
