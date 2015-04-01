class AddCollectionIdToInnovations < ActiveRecord::Migration
  def change
    add_column :innovations, :collection_id, :integer
  end
end
