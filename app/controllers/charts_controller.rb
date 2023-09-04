class ChartsController < ApplicationController
  def index
    @posts_with_genre = Post.where.not(genre: nil)
    genre_counts = Hash.new(0)
    @posts_with_genre.each do |post|
      genre_counts[post.genre] += 1
    end

    @genre_labels = genre_counts.keys
    @genre_data = genre_counts.values
  end
end
