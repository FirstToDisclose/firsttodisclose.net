class AddUserIdToInnovationTags < ActiveRecord::Migration
  def change
    add_column :innovation_tags, :user_id, :integer
  end
end
