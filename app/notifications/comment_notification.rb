class CommentNotification < Noticed::Base
  # Add your delivery methods

  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"
  def message
    @post = Post.find(params[:comment][:post_id])
    @comment = Comment.find(params[:comment][:id])
    @user = User.find(@comment.user_id)
    "#{@user.username} commented on #{@post.song_name.truncate(10)}"
  end

  def url
    posts_path
  end
end
