# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Movie.destroy_all
user1_data = {
	full_name: "Test2",
	user_name: "testty mcgee",
	email: "test@test.com",
	password: "test",
	about_me: "i like turtles"
}
user1 = User.create(user1_data)

movie_data = {
	e_title: "Spirited Away",
	j_title: "Sen to Chihiro no Kamikakushi",
	img_url: "https://static.hummingbird.me/anime/poster_images/000/000/176/large/rI6EJ2r.jpg?1440954517"
}
movie1 = Movie.create(movie_data)