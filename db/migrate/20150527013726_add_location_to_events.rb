class AddLocationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :user_id,     :integer
    add_column :events, :title,       :string
    add_column :events, :street_1,    :string
    add_column :events, :street_2,    :string
    add_column :events, :city,        :string
    add_column :events, :state,       :string
    add_column :events, :country,     :string
    add_column :events, :postal_code, :string
    add_column :events, :longitude,   :string
    add_column :events, :latitude,    :string
  end
end
