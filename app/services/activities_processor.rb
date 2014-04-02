class ActivitiesProcessor

  def initialize(user)
    @user = user
  end

  def process(subject, target, type = nil)
    if subject.persisted?
      type ||= "#{subject.class.name}Activity"
      user.followers.each do |follower|
        follower.activities.create(
          subject: subject,
          type: type,
          target: target,
          actor: @user
        )
        # mail(subject, follower)
      end
    end
  end
  handle_asynchronously :process

  private

  def mail(activity, user)
    NotificationMailer.notification_email(activity, user).deliver
  end
  handle_asynchronously :mail

  attr_reader :user

end
