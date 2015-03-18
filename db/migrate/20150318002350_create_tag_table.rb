class CreateTagTable < ActiveRecord::Migration
  def change
    create_table :tag_tables do |t|
      t.string "name", null: false

      t.timestamps
    end
  end
end
