require 'json'
require 'faker'

puts 'Destroy previous data'
List.destroy_all
Movie.destroy_all

response = RestClient.get 'http://tmdb.lewagon.com/movie/top_rated'
movies = JSON.parse(response)

movies['results'].each do |movie|
  movie = Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average'].to_f
  )
  puts "The movie #{movie.title} has been created"

end

15.times do
  puts 'Creating 15 fake lists...'
  list = List.new(
    name: Faker::Emotion.noun
  )
  list.save!
end

puts 'Finished!'
