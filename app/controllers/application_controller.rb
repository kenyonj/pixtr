class ApplicationController < ActionController::Base
  include Clearance::Controller

  protect_from_forgery with: :exception

  private

  def process_activity(subject, target, type = nil)
    ActivitiesProcessor.new(current_user).process(subject, target, type)
  end
end
