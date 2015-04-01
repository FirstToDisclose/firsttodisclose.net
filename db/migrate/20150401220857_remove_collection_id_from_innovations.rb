class RemoveCollectionIdFromInnovations < ActiveRecord::Migration
  def change
    remove_column :innovations, :collection_id, :integer
  end
end
