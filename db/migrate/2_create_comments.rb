class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :rating
      t.string :entered_by
      t.references :recipe

      t.timestamps null: true
    end
    add_foreign_key :comments, :recipes
  end
end
