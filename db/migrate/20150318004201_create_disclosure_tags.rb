class CreateDisclosureTags < ActiveRecord::Migration
  def change
    create_table :disclosure_tags do |t|
      t.integer :disclosure_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
