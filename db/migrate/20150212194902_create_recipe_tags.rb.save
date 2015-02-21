class CreateRecipeTags < ActiveRecord::Migration
  def change
    create_table :recipe_tags, :id => false do |t|
      t.references :recipe, index: true
      t.references :tag, index: true

      t.timestamps null: true
    end
    # add_foreign_key :recipe, :recipes
    # add_foreign_key :recipe_tags, :tags
    # add_foreign_key :tags, :recipe_tags
    # add_foreign_key :recipe, :recipe_tags
    add_index :recipe_tags, [:recipe_id, :tag_id], :unique => true
  end
end
