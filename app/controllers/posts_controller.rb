class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.friend_posts(current_user)
    @myposts = Post.where(user_id: @user.id)
    @favourites = FavouritePost.all
  end

  def new
    @post = Post.new
    # @song = RSpotify::Track.find('7KA4W4McWYRpgf0fWsJZWB')
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.user = @user
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
        # #https://open.spotify.com/track/1z6WtY7X4HQJvzxC4UgkSf?si=7bed3c6456414f87
        # @post = Post.find(params[:id])
        # @post.update!(post_params)
        # @link_id = @post.link.split('/').last.split('?').first #this should be a method in the model post
        # @song = RSpotify::Track.find(@link_id) #this can also be in model
        # @song_title = @song.name
        # @song_artists = @song.artists
        # @artist = @song_artists.map { |artist| artist.name }.join(', ')
        # @album_art = @song.album.images.first["url"]
        # @post.song_name = @song_title
        # @post.artist = @artist
        # @post.user = @user
        # @post.image_url = @album_art
        # if @post.update!
        #   redirect_to posts_path
        # else
        #   render :new, status: :unprocessable_entity
        # end
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
