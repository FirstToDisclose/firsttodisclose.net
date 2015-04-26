class CreateLivePages < ActiveRecord::Migration
  def change
    create_table :live_pages do |t|
      t.string :hangout_url
      t.timestamps null: false
    end
  end
end
