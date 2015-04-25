class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.string :title
      t.text :abstract
      t.text :body
      t.boolean :consented
      t.integer :user_id
      t.integer :innovation_id
      t.timestamps null: false
    end
  end
end
