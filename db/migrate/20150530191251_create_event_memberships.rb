class CreateEventMemberships < ActiveRecord::Migration
  def change
    create_table :event_memberships do |t|
      t.boolean :approved, default: false
      t.integer :user_id
      t.integer :event_id
      t.timestamps null: false
    end
  end
end
