# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Movie.destroy_all
puts 'Creating movies...'

movie_names = []

100.times do
  movie = Movie.create!(
    title: Faker::Movie.unique.title,
    overview: Faker::Lorem.paragraph,
    poster_url: Faker::LoremFlickr.image(size: '50x60', search_terms: ['movies']),
    rating: rand(0...5)
  )
  movie_names << movie.title
end

movie_names.each do |n|
  puts "Created #{n}"
end
puts 'Finished! Creation complete.'
