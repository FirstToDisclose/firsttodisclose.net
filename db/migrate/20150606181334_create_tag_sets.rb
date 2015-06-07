class CreateTagSets < ActiveRecord::Migration
  def change
    create_table :tag_sets do |t|
      t.string :title
      t.timestamps null: false
    end

    add_column :innovation_tags, :tag_set_id, :integer
  end
end
