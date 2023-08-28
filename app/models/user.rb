class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friendships_as_follower, class_name: "Friendship", foreign_key: :follower_id
  has_many :friendships_as_followee, class_name: "Friendship", foreign_key: :followee_id
  has_many :posts, dependent: :destroy
end
