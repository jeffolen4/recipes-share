class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :directions
      t.integer :rating

      t.timestamps null: true
    end
  end
end
