class SubscriptionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    subscription = Subscription.new(subscription_params)

    if subscription.save
      render status: 201, json: { id: subscription.id }
    else
      render status: 400, json: { errors: subscription.errors.full_messages }
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:fcm_id)
  end
end
