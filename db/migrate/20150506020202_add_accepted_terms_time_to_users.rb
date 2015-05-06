class AddAcceptedTermsTimeToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :accepted_terms_time, :datetime
  end
end
