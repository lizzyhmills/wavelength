class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favouritePosts, dependent: :destroy

  def self.friend_posts(user)
    friend_ids = user.friendships_as_follower.where(accepted: true).pluck(:followee_id)
    Post.where(user_id: friend_ids)
  end

end
