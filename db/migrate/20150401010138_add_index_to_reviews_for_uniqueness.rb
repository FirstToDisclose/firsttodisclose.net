class AddIndexToReviewsForUniqueness < ActiveRecord::Migration
  def change
    add_index :reviews, [:user_id, :innovation_id], unique: true
  end
end
