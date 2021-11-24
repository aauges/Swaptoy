class DashboardsController < ApplicationController
  def show
    @dashboard = Dashboard.where(user: current_user)
  end
end
