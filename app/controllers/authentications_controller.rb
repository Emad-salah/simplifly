class AuthenticationsController < ApplicationController
  def new
  end

  def create
    user = API.login(email: params[:user][:email], password: params[:user][:password])
    if user
      Rails.logger.info "Setting token: #{user}"
      cookies[:token] = user["token"]
      Rails.logger.info "Cookie: #{cookies[:token]}"
      redirect_to profile_path
    else
      render 'new'
    end
  end
end
