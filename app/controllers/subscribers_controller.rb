class SubscribersController < ApplicationController
  allow_unauthenticated_access
  before_action :set_product

  def create
    @product.subscribers.where(subscriber_params).first_or_create
    redirect_to @product, notice: "You are now subscribed to this product."
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def subscriber_params
    params.expect(subscriber: [ :email ])
  end


  def unsubscribe
    @subscriber = Subscriber.find_by!(unsubscribe_token: params[:token])
    @subscriber.destroy!
    render :unsubscribe
  end
end
