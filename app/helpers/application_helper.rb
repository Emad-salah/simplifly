module ApplicationHelper

  def timestamp_to_string t
    datetime = Time.at(t.to_i).to_datetime
    datetime.strftime("%m/%d")
  end

  def card_button_text_for user
    if @user["subscribed"] && @user["subscription"]["stripe_token"] 
      "Update Credit Card"
    elsif @user["subscribed"]
      "Add Credit Card"
    else
     "Subscribe"
   end
  end
end
