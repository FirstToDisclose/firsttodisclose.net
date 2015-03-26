class ChangeDisclosureTagsToInnovationTags < ActiveRecord::Migration
  def up
    rename_table :disclosure_tags, :innovation_tags
    rename_column :innovation_tags, :disclosure_id, :innovation_id
  end

  def down
    rename_table :innovation_tags, :disclosure_tags
    rename_column :disclosure_tags, :innovation_id, :disclosure_id
  end
end
