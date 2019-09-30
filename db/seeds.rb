# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Song.destroy_all
User.destroy_all

10.times do
    Song.create(title: Faker::Music::GratefulDead.song, artist: Faker::Music::RockBand.name, genre: Faker::Music.genre, album: Faker::Music.album)
end

5.times do
    User.create(name: Faker::Book.author)
end
