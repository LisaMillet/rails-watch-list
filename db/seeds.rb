require 'json'

puts 'Destroy previous data'
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
