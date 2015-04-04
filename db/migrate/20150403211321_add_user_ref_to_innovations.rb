class AddUserRefToInnovations < ActiveRecord::Migration
  def change
    add_reference :innovations, :user, index: true
    add_foreign_key :innovations, :users
  end
end
