class AddAcceptedToFriendships < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :accepted, :boolean
  end
end
