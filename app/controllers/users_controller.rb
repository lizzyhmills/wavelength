class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @userpost = @user.posts.where(post_date: Date.today).first
    # @searched_posts = @user.favourite_posts

    # if params[:query].present?
    #   sql_subquery = <<~SQL
    #   SELECT * FROM posts
    #   WHERE song_name @@ :query
    #   OR artist @@ :query
    #   OR post_date::text @@ :query;
    #   SQL
    #   @posts = @posts.where(sql_subquery, query: "%#{params[:query]}%")
    # end
    if params[:query].present?
      @posts = Post.where(user: @user).search_by_artist_and_song(params[:query])
      # @favourite_posts = FavouritePost.includes(:post).where(user: @user).search_by_artist_and_song(params[:query])
    else
      @favourite_posts = @user.favourite_posts.reverse
      @posts = @user.posts.reverse
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user
      redirect_to user_path(@user)
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:bio, :avatar_url, :first_name, :last_name, :photo)
  end
end
