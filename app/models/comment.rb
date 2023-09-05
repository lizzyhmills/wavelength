class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :content, presence: true, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }
  has_noticed_notifications model_name: 'Notification'
  after_create_commit :notify_recipient
  # { broadcast_notifications }
  before_destroy :cleanup_notifications

  private

  def notify_recipient
    CommentNotification.with(comment: self, post: post).deliver_later(post.user)
  end

  def cleanup_notifications
    notifications_as_comment.destroy_all
  end
end
