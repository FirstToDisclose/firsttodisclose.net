class RemoveEventFromCollections < ActiveRecord::Migration
  def change
    remove_column :collections, :event_id, :integer
  end
end
