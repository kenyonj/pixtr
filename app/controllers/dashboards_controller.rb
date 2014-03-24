class DashboardsController < ApplicationController
  def show
    @activities = current_user.activities
  end
end
