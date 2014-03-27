class NotificationMailer < ActionMailer::Base
  default from: "admin@pixtr.dev"

  def notification_email(activity, user)
    @activity = activity
    @user = user

    mail(to: @user.email, subject: "You have new activity from your followers")
  end
end
