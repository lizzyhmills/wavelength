# To deliver this notification:
#
# FriendshipNotification.with(post: @post).deliver_later(current_user)
# FriendshipNotification.with(post: @post).deliver(current_user)

class FriendshipNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  def message
    @friendship = Friendship.find(params[:friendship][:id])
    @follower = User.find(@friendship.follower_id)
    "#{@follower.username} has requested to follow you"
  end

  # def user
  #   @post = Post.find(params[:comment][:post_id])
  #   @comment = Comment.find(params[:comment][:id])
  #   @user = User.find(@comment.user_id)
  # end

  def url
    friendships_path
  end
end
