class SubscriptionsController < ApplicationController

  before_action :authenticate

  def show
    @subscription = @user["subscription"]
    Rails.logger.info @subscription
  end

  def update
    if @user["subscribed"]
      API.updateSubscription(token: cookies[:token], subscription: params[:subscription])
    else
      API.createSubscription(token: cookies[:token], subscription: params[:subscription])
    end
  end

  def destroy
    API.deleteSubscription(token: cookies[:token])
  end
end
