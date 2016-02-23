class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :review
      t.string :movie_name
      t.references :user
      t.references :movie

      t.timestamps null: false
    end
  end
end
