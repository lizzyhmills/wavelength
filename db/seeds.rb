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
file1 = File.open("app/assets/images/tom-profile-pic.png")
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
post1 = Post.new(song_name: "Kids", artist: "MGMT", image_url: "https://i.scdn.co/image/ab67616d0000b2738b32b139981e79f2ebe005eb", caption: "I love this song", genre: "https://p.scdn.co/mp3-preview/efb065069d22384206b0fc703c6f99734d33411d?cid=468c7327294c4d6dbe2b2d6fc3821b38")
post1.user = tom
post1.save!
puts "created Toms post"

puts "creating Lizs post"
post2 = Post.new(song_name: "Crazy, Classic, Life!", artist: "Janelle Monae", image_url: "https://i.scdn.co/image/ab67616d0000b2730a60fb0deda858270cca82ee", caption: "Women in stem!", genre: "https://p.scdn.co/mp3-preview/181bc4250d9cedd3ce0a6bcbae6cc21e95955d0d?cid=468c7327294c4d6dbe2b2d6fc3821b38https://p.scdn.co/mp3-preview/181bc4250d9cedd3ce0a6bcbae6cc21e95955d0d?cid=468c7327294c4d6dbe2b2d6fc3821b38")
post2.user = liz
post2.save!
puts "created Lizs post"

puts "creating Nicos post"
post3 = Post.new(song_name: "Gasoline", artist: "The Weekend", image_url: "https://i.scdn.co/image/ab67616d0000b2734ab2520c2c77a1d66b9ee21d", caption: "That 80s sound")
post3.user = nico
post3.save!
puts "created Nicos post"

puts "creating Barks post"
post4 = Post.new(song_name: "Redbone", artist: "Childish Gambino", image_url: "https://i.scdn.co/image/ab67616d0000b2737582716b3666a5235d5af4ea", caption: "Just an amazing tune", genre: "https://p.scdn.co/mp3-preview/14918511e11a9e46fa170413821e5f89bd31872a?cid=468c7327294c4d6dbe2b2d6fc3821b38")
post4.user = bark
post4.save!
puts "created Barks post"

puts "creating Terezas post"
post5 = Post.new(song_name: "See you Again", artist: "Tyler the Creator", image_url: "https://i.scdn.co/image/ab67616d0000b2738940ac99f49e44f59e6f7fb3", caption: "Top tune", genre: "https://p.scdn.co/mp3-preview/c703198293891e3b276800ea6b187cf7951d3d7d?cid=468c7327294c4d6dbe2b2d6fc3821b38")
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
