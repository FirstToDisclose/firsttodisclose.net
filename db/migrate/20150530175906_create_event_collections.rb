class CreateEventCollections < ActiveRecord::Migration
  def change
    create_table :event_collections do |t|
      t.integer :event_id
      t.integer :collection_id
    end
  end
end
