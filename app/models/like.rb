class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_noticed_notifications model_name: 'Notification'
  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications

  def notify_recipient
    LikeNotification.with(like: self, post: post).deliver_later(post.user)
  end

  def cleanup_notifications
    notifications_as_like.destroy_all
  end
end
