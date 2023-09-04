class FavouritePost < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # include PgSearch::Model
  # pg_search_scope :search_by_artist_and_song,
  #   against: [ :song_name, :artist ],
  #   using: {
  #     tsearch: { prefix: true }
  #   }

end
