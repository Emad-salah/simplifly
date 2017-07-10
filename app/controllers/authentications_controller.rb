class AuthenticationsController < ApplicationController
  def new
  end

  def create
    user = API.login(email: params[:user][:email], password: params[:user][:password])
    if user
      Rails.logger.info "Setting token: #{user}"
      cookies[:token] = user["token"]
      Rails.logger.info "Cookie: #{cookies[:token]}"
      response = {
        :status => "OK",
        :message => "Success"
      }
      format.json { render :json => response }
    else
      response = {
        :status => "Not Found",
        :message => "Failed"
      }
      format.json { render :json => response }
    end
  end
end
