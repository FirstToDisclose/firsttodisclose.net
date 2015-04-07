class AddReviewerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reviewer, :boolean, default: false
  end
end
