# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
# require "open-uri"

User.destroy_all

puts "DB cleaned"

User.create!(email: "tom@lw.org", password: "123456", first_name: "Tom", last_name: "Fallis", bio: "Music lover of genres", username: "tom")
puts " Tom created"
User.create!(email: "liz@lw.org", password: "123456", first_name: "Liz", last_name: "Mills", bio: "I like songs", username: "liz")
puts "Liz created"
User.create!(email: "nico@lw.org", password: "123456", first_name: "Nico", last_name: "Grubi", bio: "Music is life", username: "nico")
puts " Nico created"
User.create!(email: "bark@lw.org", password: "123456", first_name: "Barkhadle", last_name: "Yusuf", bio: "Love me a good tune I do", username: "barkhadle")
puts " Barkhadle created"
User.create!(email: "tereza@lw.org", password: "123456", first_name: "Tereza", last_name: "Dragoti", bio: "Wooooooo music!!!", username: "tereza")
puts " Tereza  created"

User.all.each do |user|
  post = Post.new(song_name: Faker::Music::PearlJam.song, artist: "Pearl Jam", caption: Faker::Music::Prince.lyric)
  post.user = user
  post.save
  if User.first == user
    User.where.not(id: user.id).each do |other_user|
     friendship = Friendship.new
     friendship.follower = user
     friendship.followee = other_user
     friendship.save!
     p friendship
    end
  end
end
