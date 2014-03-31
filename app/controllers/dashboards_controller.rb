class DashboardsController < ApplicationController
  def show
    @activities = current_user.activities.
                    recent.
                    includes(:subject)
  end
end
