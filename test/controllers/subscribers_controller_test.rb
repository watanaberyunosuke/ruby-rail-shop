require "test_helper"

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  def unsubscribe
    Rails.logger.debug("Token param: #{params[:token]}")
    Rails.logger.debug("Found subscriber: #{Subscriber.find_by(unsubscribe_token: params[:token])&.attributes}")
    @subscriber = Subscriber.find_by!(unsubscribe_token: params[:token])
    @subscriber.destroy
    render :unsubscribe
  end
end
