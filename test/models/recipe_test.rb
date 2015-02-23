require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not allow recipe without a name" do
    recipe = Recipe.new
    recipe.directions = "dummy directions"
    assert_not recipe.save
  end

  test "should not allow recipe without directions" do
    recipe = Recipe.new
    recipe.name = "dummy name"
    assert_not recipe.save
  end
  
end
