class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :current_monthly_subscription
  # def current_user
  #   if session[:user_id]
  #     @user = User.find(session[:user_id])
  #   end
  # end

  def current_monthly_subscription
    if current_user && current_user.monthly_subscriptions.where(confirmed: false).present?
      @current_monthly_subscription = current_user.monthly_subscriptions.where(confirmed: false).last
    elsif current_user
      if session[:monthly_subscription] && MonthlySubscription.find_by(id: session[:monthly_subscription], user: current_user, confirmed: false)
        @current_monthly_subscription = MonthlySubscription.find(session[:monthly_subscription])
      else
        @current_monthly_subscription = MonthlySubscription.create!(user: current_user, confirmed: false)
        session[:monthly_subscription] = @current_monthly_subscription.id
      end
    end
  end

  def login?
    !!current_user
  end

  def authenticated?
    redirect_to new_user_session_path unless login?
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
