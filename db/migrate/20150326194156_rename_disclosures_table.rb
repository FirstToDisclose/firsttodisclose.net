class RenameDisclosuresTable < ActiveRecord::Migration
  def up
    rename_table :disclosures, :innovations
  end

  def down
    rename_table :innovations, :disclosures
  end

end
