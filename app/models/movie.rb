class Movie < ActiveRecord::Base
	has_many :user_movies
	has_many :reviews
	has_many :users, :through => :user_movies
	has_many :users, :through => :reviews
end
