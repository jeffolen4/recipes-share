class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comments
      t.integer :star_rating
      t.references :recipe, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :recipes
  end
end
