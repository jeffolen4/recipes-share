class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :recipe_tags, index: true

      t.timestamps null: true
    end
    add_foreign_key :tags, :recipe_tags
  end
end
