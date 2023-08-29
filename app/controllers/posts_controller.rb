class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.where(user_id: @user.friendships_as_follower.map { |friend| friend.followee.id })
    @myposts = Post.where(user_id: @user.id)
  end

  def new
    @post = Post.new
    @song = RSpotify::Track.find('2ezQq2qWhGO6J6q5JwC50d')
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    #https://open.spotify.com/track/1z6WtY7X4HQJvzxC4UgkSf?si=7bed3c6456414f87
    @link_id = @post.link.split('/').last.split('?').first #this should be a method in the model post
    @song = RSpotify::Track.find(@link_id) #this can also be in model
    @song_title = @song.name
    @song_artists = @song.artists
    @artist = @song_artists.map { |artist| artist.name }.pop
    @album_art = @song.album.images.first["url"]
    @post.song_name = @song_title
    @post.artist = @artist
    @post.user = @user
    @post.image_url = @album_art
    if @post.save!
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:link, :caption)
  end
end
