class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer  :innovation_id
      t.integer  :user_id
      t.integer  :novelty_rating, null: false
      t.integer  :usability_rating, null: false
      t.integer  :value_rating, null: false
      t.integer  :fourth_rating, null: false
      t.integer  :fifth_rating, null: false
      t.text     :content
      t.timestamps null: false
    end
  end
end
