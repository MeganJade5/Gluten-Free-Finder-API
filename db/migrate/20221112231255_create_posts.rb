class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :restaurant_name
      t.string :street_number
      t.string :street_name
      t.string :suburb
      t.integer :postcode
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :cuisine, null: false, foreign_key: true
      t.references :food_prep, null: false, foreign_key: true
      t.boolean :live_status

      t.timestamps
    end
  end
end
