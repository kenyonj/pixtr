class DashboardsController < ApplicationController
  def show
    @activities = current_user.activities.
                    recent.
                    includes(:target, :actor)
  end
end
