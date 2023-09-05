class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  # friendships_as_follower is for the people that the user follows.
  has_many :friendships_as_follower, class_name: "Friendship", foreign_key: :follower_id
  # friendships_as_followee is for the people that follow the user.
  has_many :friendships_as_followed, class_name: "Friendship", foreign_key: :followee_id
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favourite_posts, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy
  validates :first_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :bio, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }

end
