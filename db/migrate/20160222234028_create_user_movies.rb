class CreateUserMovies < ActiveRecord::Migration
  def change
    create_table :user_movies do |t|
    	t.string "movie_title"
    	t.references :user
    	t.references :movie

      t.timestamps null: false
    end
  end
end
