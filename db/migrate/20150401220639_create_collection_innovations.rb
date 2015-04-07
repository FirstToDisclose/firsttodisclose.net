class CreateCollectionInnovations < ActiveRecord::Migration
  def change
    create_table :collection_innovations do |t|
      t.integer :collection_id
      t.integer :innovation_id
      t.timestamps null: false
    end
  end
end
