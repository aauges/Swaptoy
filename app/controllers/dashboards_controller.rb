class DashboardsController < ApplicationController
  def show
    @previous_subscriptions = current_user.monthly_subscriptions.where(confirmed: true)
  end
end
