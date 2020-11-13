class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.boolean :availability
      t.string :category
      t.string :light
      t.string :difficulty
      t.float :price
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
