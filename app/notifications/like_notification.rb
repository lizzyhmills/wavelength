class LikeNotification < Noticed::Base
  # Add your delivery methods

  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"
  def message
    @post = Post.find(params[:like][:post_id])
    @like = Like.find(params[:like][:id])
    @user = User.find(@like.user_id)
    "#{@user.username} liked #{@post.song_name.truncate(10)}"
  end

  def user
    @post = Post.find(params[:like][:post_id])
    @like = Like.find(params[:like][:id])
    @user = User.find(@like.user_id)
  end

  def url
    posts_path
  end
end
