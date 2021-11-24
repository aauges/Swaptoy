class ApplicationController < ActionController::Base
  before_action :authenticated?, :current_user, :monthly_subscription

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def current_monthly_subscription
    if login?
      @monthly_subscription = @user.monthly_subscription
    else
      if session[:monthly_subscription]
        @monthly_subscription = MonthlySubscription.find(session[:monthly_subscription])
      else
        @monthly_subscription = MonthlySubscription.create
        session[:monthly_subscription] = @monthly_subscription.id
      end
    end
  end

  def login?
    !!current_user
  end

  def authenticated?
    redirect_to toy_login_path unless login?
  end
end
