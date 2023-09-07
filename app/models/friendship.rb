class Friendship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followee, class_name: "User"
  has_noticed_notifications model_name: 'Notification'
  after_create_commit :notify_recipient
  # { broadcast_notifications }
  before_destroy :cleanup_notifications

  private

  def notify_recipient
    FriendshipNotification.with(friendship: self, follower: follower).deliver_later(followee)
  end

  def cleanup_notifications
    notifications_as_friendship.destroy_all
  end
end
