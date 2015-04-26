class AddHiddenToInnovation < ActiveRecord::Migration
  def change
    add_column :innovations, :hidden, :boolean, default: false
  end
end
