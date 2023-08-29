class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @favourite_posts = @user.favourite_posts
  end

end
