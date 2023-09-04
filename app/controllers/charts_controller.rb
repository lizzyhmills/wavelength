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
    @artist_counts = Hash.new(0)
    @posts.each do |post|
      @artist_counts[post.artist] += 1
    end

    @artist_labels = @artist_counts.keys
    @artist_data = @artist_counts.values

  end
end
