class CreateStoreReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :store_reviews do |t|
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.text :comment
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
