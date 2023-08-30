# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "open-uri"

Friendship.destroy_all
Post.destroy_all
User.destroy_all
puts "DB cleaned"

tom = User.new(email: "tom@lw.org", password: "123456", first_name: "Tom", last_name: "Fallis", bio: "Music lover of genres", username: "tom")
file1 = File.open("app/assets/images/tom profile pic.png")
tom.photo.attach(io: file1, filename: "profile.png", content_type: "image/png")
tom.save!
puts " Tom created"
liz = User.new(email: "liz@lw.org", password: "123456", first_name: "Liz", last_name: "Mills", bio: "I like songs", username: "liz")
file2 = File.open("app/assets/images/liz profile pic.png")
liz.photo.attach(io: file2, filename: "profile.png", content_type: "image/png")
liz.save!
puts "Liz created"
nico = User.new(email: "nico@lw.org", password: "123456", first_name: "Nico", last_name: "Grubi", bio: "Music is life", username: "nico")
file3 = File.open("app/assets/images/nicoleta profile pic.png")
nico.photo.attach(io: file3, filename: "profile.png", content_type: "image/png")
nico.save!
puts " Nico created"
bark = User.new(email: "bark@lw.org", password: "123456", first_name: "Barkhadle", last_name: "Yusuf", bio: "Love me a good tune I do", username: "barkhadle")
file4 = File.open("app/assets/images/barkhadle profile pic.png")
bark.photo.attach(io: file4, filename: "profile.png", content_type: "image/png")
bark.save!
puts " Barkhadle created"
tereza = User.new(email: "tereza@lw.org", password: "123456", first_name: "Tereza", last_name: "Dragoti", bio: "Wooooooo music!!!", username: "tereza")
file5 = File.open("app/assets/images/tereza profile pic.png")
tereza.photo.attach(io: file5, filename: "profile.png", content_type: "image/png")
tereza.save!
puts " Tereza  created"

puts "creating Toms post"
post1 = Post.new(song_name: "Yesterday", artist: "The Beatles", image_url: "https://i.scdn.co/image/ab67616d0000b273e3e3b64cea45265469d4cafa", caption: "I love this song")
post1.user = tom
post1.save!
puts "created Toms post"

puts "creating Lizs post"
post2 = Post.new(song_name: "White Mercedes", artist: "Charlie XCX", image_url: "https://i.scdn.co/image/ab67616d0000b273cee4acc7bfe23bc75461a66c", caption: "Women in stem!")
post2.user = liz
post2.save!
puts "created Lizs post"

puts "creating Nicos post"
post3 = Post.new(song_name: "Gasoline", artist: "The Weekend", image_url: "https://i.scdn.co/image/ab67616d0000b2734ab2520c2c77a1d66b9ee21d", caption: "That 80s sound")
post3.user = nico
post3.save!
puts "created Nicos post"

puts "creating Barks post"
post4 = Post.new(song_name: "Redbone", artist: "Childish Gambino", image_url: "https://i.scdn.co/image/ab67616d0000b2737582716b3666a5235d5af4ea", caption: "Just an amazing tune")
post4.user = bark
post4.save!
puts "created Barks post"

puts "creating Terezas post"
post5 = Post.new(song_name: "See you Again", artist: "Tyler the Creator", image_url: "https://i.scdn.co/image/ab67616d0000b2738940ac99f49e44f59e6f7fb3", caption: "Top tune")
post5.user = tereza
post5.save!
puts "created Terezas post"

# User.all.each do |user|
#   if User.first == user
#     User.where.not(id: user.id).each do |other_user|
#      friendship = Friendship.new
#      friendship.follower = user
#      friendship.followee = other_user
#      friendship.save!
#      p friendship
#     end
#   end
# end
