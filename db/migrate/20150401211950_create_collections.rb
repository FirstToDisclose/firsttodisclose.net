class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string   :title, null: false
      t.integer  :user_id
      t.timestamps null: false
    end
  end
end
