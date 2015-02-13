class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :description
      t.references :recipe, index: true

      t.timestamps null: false
    end
    add_foreign_key :tags, :recipes
  end
end
