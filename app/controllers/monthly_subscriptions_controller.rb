class MonthlySubscriptionsController < ApplicationController

  def create

  end

  def show
    @monthly_subscription = current_user.monthly_subscriptions.last
  end

  def confirm
    @monthly_subscription = MonthlySubscription.find(params[:id])
    @monthly_subscription.start_date = Date.today
    @monthly_subscription.end_date = Date.today + 30.days
    @monthly_subscription.return_status = false
    @monthly_subscription.total_slots = 5
    @monthly_subscription.confirmed = true
    @monthly_subscription.save!
  end
end
