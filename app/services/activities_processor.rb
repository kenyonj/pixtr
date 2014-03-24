class ActivitiesProcessor

  def initialize(user)
    @user = user
  end

  def process(subject, type = nil)
    type ||= "#{subject.class.name}Activity"
    user.followers.each do |follower|
      follower.activities.create(
        subject: subject,
        type: type
      )
    end
  end

  private

  attr_reader :user

end
