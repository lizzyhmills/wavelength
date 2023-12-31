class Post < ApplicationRecord
  belongs_to :user
  validate :valid_spotify_link
  # validates :content, presence: true
  # validate :one_post_a_day
  validates :post_date, uniqueness: { scope: :user_id, message: 'One post a day' }
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favourite_posts, dependent: :destroy
  before_validation :set_post_date
  before_save :spotify_call
  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_artist_and_song,
    against: [ :song_name, :artist ],
    using: {
      tsearch: { prefix: true }
    }

  def self.feed_posts(user)
    friend_ids = user.friendships_as_follower.where(accepted: true).pluck(:followee_id)
    Post.where(user_id: friend_ids, post_date: Date.today)
  end

  def set_post_date
    self.post_date = Date.today
  end

  def spotify_call
    link_id = self.link.split('/').last.split('?').first # this should be a method in the model post
    song = RSpotify::Track.find(link_id) # this can also be in model
    band = RSpotify::Artist.find(song.artists.first.id)
    song_title = song.name
    song_artists = song.artists
    preview = song.preview_url unless song.nil?
    artist = song_artists.map { |artist| artist.name }.join(', ')
    album_art = song.album.images.first["url"]
    genre = band.genres.first
    self.song_name = song_title
    self.artist = artist
    self.preview = preview
    self.image_url = album_art
    self.genre = genre
  end

  def valid_spotify_link
    logger.debug "Inside valid_spotify_link method" # Add this line
    # Use a regular expression to check if the link matches a Spotify track URL
    if link.include?("spotify.link")
      p "Contains Link!"
      redirect_url = Net::HTTP.get_response(URI(link))
      self.link = redirect_url["location"]
    end
    p link
    spotify_url_regex = %r{^(spotify:|https:\/\/[a-z]+\.spotify\.com\/)}
    unless link =~ spotify_url_regex
      errors.add(:link, "must be a valid Spotify track URL")
    end
  end

  # def one_post_a_day

  # end

end
