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
file2 = File.open("app/assets/images/liz-profile-pic.png")
liz.photo.attach(io: file2, filename: "profile.png", content_type: "image/png")
liz.save!
puts "Liz created"
nico = User.new(email: "nico@lw.org", password: "123456", first_name: "Nico", last_name: "Grubi", bio: "Music is life", username: "nico")
file3 = File.open("app/assets/images/nicoleta-profile-pic.png")
nico.photo.attach(io: file3, filename: "profile.png", content_type: "image/png")
nico.save!
puts " Nico created"
bark = User.new(email: "bark@lw.org", password: "123456", first_name: "Barkhadle", last_name: "Yusuf", bio: "Love me a good tune I do", username: "barkhadle")
file4 = File.open("app/assets/images/barkhadle-profile-pic.png")
bark.photo.attach(io: file4, filename: "profile.png", content_type: "image/png")
bark.save!
puts " Barkhadle created"
tereza = User.new(email: "tereza@lw.org", password: "123456", first_name: "Tereza", last_name: "Dragoti", bio: "Wooooooo music!!!", username: "tereza")
file5 = File.open("app/assets/images/tereza-profile-pic.png")
tereza.photo.attach(io: file5, filename: "profile.png", content_type: "image/png")
tereza.save!
puts " Tereza  created"

# START OF USER UPDATES


hen = User.new(email: "hen@lw.org", password: "123456", first_name: "Henry", last_name: "Ireland", bio: "Music lover of genres", username: "henners")
file6 = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1688723707/qdadpbapkht2mrcnqcnw.jpg")
hen.photo.attach(io: file6, filename: "profile.png", content_type: "image/png")
hen.save!
puts " Henry created"
max = User.new(email: "max@lw.org", password: "123456", first_name: "Max", last_name: "Lana", bio: "I like songs", username: "maximus")
file7 = URI.open("https://avatars.githubusercontent.com/u/139062226?v=4")
max.photo.attach(io: file7, filename: "profile.png", content_type: "image/png")
max.save!
puts "Max created"
oli = User.new(email: "oli@lw.org", password: "123456", first_name: "Ollie", last_name: "Pugh", bio: "Music is life", username: "olliep")
file8 = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1688748199/deoankppdkifpak0btxz.jpg")
oli.photo.attach(io: file8, filename: "profile.png", content_type: "image/png")
oli.save!
puts " Oli created"
dav = User.new(email: "david@lw.org", password: "123456", first_name: "David", last_name: "Whitehead", bio: "Love me a good tune I do", username: "bigdav")
file9 = URI.open("https://avatars.githubusercontent.com/u/122481391?v=4")
dav.photo.attach(io: file9, filename: "profile.png", content_type: "image/png")
dav.save!
puts " Dav created"


# END OF USERS

puts "creating Toms post"
post1 = Post.new(link: "https://open.spotify.com/track/1jJci4qxiYcOHhQR247rEU?si=43213acad65f4242", caption: "I love this song")
post1.user = tom
post1.save!
puts "created Toms post"

puts "creating Lizs post"
post2 = Post.new(link: "https://open.spotify.com/track/06EAtSDu3KSoi4fbA3ZjoB?si=6afc548948744bdd", caption: "What a queen")
post2.user = liz
post2.save!
puts "created Lizs post"

puts "creating Nicos post"
post3 = Post.new(link: "https://open.spotify.com/track/3KyKxJ4P3pVCgaZwaq2rUC?si=c8889c7c991d49ba", caption: "Soooo good")
post3.user = nico
post3.save!
puts "created Nicos post"

puts "creating Barks post"
post4 = Post.new(link: "https://open.spotify.com/track/0WtDGnWL2KrMCk0mI1Gpwz?si=140467dabd844a27", caption: "What a queen")
post4.user = bark
post4.save!
puts "created Barks post"

puts "creating Terezas post"
post5 = Post.new(link: "https://open.spotify.com/track/7KA4W4McWYRpgf0fWsJZWB?si=24cc8cecae9a4b4d", caption: "Amaaaze")
post5.user = tereza
post5.save!
puts "created Terezas post"

puts "creating Hens post"
post6 = Post.new(link: "https://open.spotify.com/track/6IZvVAP7VPPnsGX6bvgkqg?si=c4be4fa92cff4f1a", caption: "The king")
post6.user = hen
post6.save!
puts "created Henss post"

puts "creating Max post"
post7 = Post.new(link: "https://open.spotify.com/track/4wajJ1o7jWIg62YqpkHC7S?si=6a6a22dcb9fb47ae", caption: "RADIOOO HEEAAD")
post7.user = max
post7.save!
puts "created Max post"

puts "creating Olis post"
post8 = Post.new(link: "https://open.spotify.com/track/5LIwaG8Wl9LfExcmiRQm7J?si=8791ad40883f4d07", caption: "D'anglo swagg")
post8.user = oli
post8.save!
puts "created Oli post"

puts "creating Daves post"
post9 = Post.new(link: "https://open.spotify.com/track/5TDZyWDfbQFQJabbPwImVY?si=3195ec49652a4a0b", caption: "Let the fleet out")
post9.user = dav
post9.save!
puts "created Daves post"

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
