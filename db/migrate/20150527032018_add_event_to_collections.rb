class AddEventToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :event_id, :integer
  end
end
