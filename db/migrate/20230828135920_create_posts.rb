class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :link
      t.string :song_name
      t.string :artist
      t.text :caption
      t.references :user, null: false, foreign_key: true
      t.string :image_url
      t.string :genre
      t.date :post_date

      t.timestamps
    end
  end
end
