class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :e_title
      t.string :j_title
      t.string :img_url

      t.timestamps null: false
    end
  end
end
