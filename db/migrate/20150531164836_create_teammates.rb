class CreateTeammates < ActiveRecord::Migration
  def change
    create_table :teammates do |t|
      t.boolean :approved, default: false
      t.integer :user_id
      t.integer :team_id
      t.timestamps null: false
    end
  end
end
