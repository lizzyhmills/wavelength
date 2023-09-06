class ChartsController < ApplicationController
  def index
    @posts_with_genre = Post.where.not(genre: nil)
    @posts_with_genre = @posts_with_genre.filter do |post|
      !post.genre.start_with?("https")
    end
    @genre_counts = Hash.new(0)
    @posts_with_genre.each do |post|
      @genre_counts[post.genre] += 1
    end
    @genre_labels = @genre_counts.keys
    @genre_data = @genre_counts.values
    @posts = Post.all
    @song_counts = Hash.new(0)
    @posts.each do |post|
      @song_counts[post.song_name] += 1
    end
    @song_labels = @song_counts.keys
    @song_data = @song_counts.values
  end
end
