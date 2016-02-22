class AddUserReferenceToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :users, index: true, foreign_key: true
  end
end
