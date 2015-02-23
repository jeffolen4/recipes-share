require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "do not allow ingredient with no name" do
    recipe = Recipe.first
    ingredient = Ingredient.new
    ingredient.recipe_id = recipe.id
    ingredient.amount = "1"
    ingredient.uom = "uom"
    assert_not ingredient.save
  end

  test "do not allow ingredient with no amount" do
    recipe = Recipe.first
    ingredient = Ingredient.new
    ingredient.recipe_id = recipe.id
    ingredient.name = "ingredient"
    ingredient.uom = "uom"
    assert_not ingredient.save
  end

  test "allow ingredient with no uom" do
    recipe = Recipe.first
    ingredient = Ingredient.new
    ingredient.recipe_id = recipe.id
    ingredient.name = "ingredient"
    ingredient.amount = "1"
    assert ingredient.save
  end

  test "do not allow ingredient with no recipe id" do
    recipe = Recipe.first
    ingredient = Ingredient.new
    ingredient.name = "ingredient"
    ingredient.amount = "1"
    ingredient.uom = "uom"
    assert_not ingredient.save
  end

end
