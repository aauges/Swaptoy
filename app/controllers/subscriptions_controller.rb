class SubscriptionsController < ApplicationController
  def show
      current_user.update_subscription(params[:session_id]) if params[:session_id]

      @subscription = current_user.stripe_subscription if current_user.stripe_subscription_id && current_user.stripe_subscription.status == 'active'
  end

  def new
      session = Stripe::Checkout::Session.create({
        success_url: subscription_url + '?session_id={CHECKOUT_SESSION_ID}',
        cancel_url: subscription_url,
        payment_method_types: ['card'],
        mode: 'subscription',
        line_items: [{
          # For metered billing, do not pass quantity
          quantity: 1,
          # price: params[:stripe_price_id],
          price: params[:stripe_price],
        }],
      })

      redirect_to session["url"]

  end

  def edit
      portal = Stripe::BillingPortal::Session.create({
          customer: current_user.stripe_customer_id,
          return_url: subscription_url,
      })

      redirect_to portal["url"]
  end

  def create; end

  def destroy
      customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
      customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
      current_user.update(stripe_subscription_id: nil)

      redirect_to subscription_path, notice: "Your subscription has been canceled."
  end
end
