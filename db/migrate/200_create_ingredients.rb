class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :amount
      t.string :uom
      t.references :recipe

      t.timestamps null: true
    end
    add_foreign_key :ingredients, :recipes
  end
end
