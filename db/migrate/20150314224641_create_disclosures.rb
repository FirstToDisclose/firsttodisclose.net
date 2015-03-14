class CreateDisclosures < ActiveRecord::Migration
  def change
    create_table :disclosures do |t|
      t.string :title
      t.text :abstract
      t.text :body
      t.boolean :consented

      t.timestamps null: false
    end
  end
end
