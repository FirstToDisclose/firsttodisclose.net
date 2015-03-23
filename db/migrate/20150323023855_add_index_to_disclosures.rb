class AddIndexToDisclosures < ActiveRecord::Migration
  def change
    add_index :disclosures, :title
  end
end
