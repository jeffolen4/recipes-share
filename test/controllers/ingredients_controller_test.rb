require 'test_helper'

class IngredientsControllerTest < ActionController::TestCase
  setup do
    @ingredient = ingredients(:one_1)
    @recipe = @ingredient.recipe #Recipe.where("id = " + @ingredient.recipe_id.to_s)[0]
  end

  test "should get index" do
    # recipe_ingredients_path(@recipe.id)
    get :index, recipe_id: @recipe
    assert_response :success
    assert_not_nil assigns(:ingredients)
  end

  test "should get new" do
    get :new, recipe_id: @recipe
    assert_response :success
  end

  test "should create ingredient" do
    assert_difference('Ingredient.count') do
      post :create, recipe_id: @recipe.id, ingredient: { name: "sugar", amount: "1", uom: "cup" }
    end

    assert_redirected_to recipe_ingredient_path(assigns(:recipe), assigns(:ingredient) )
  end

  test "should show ingredient" do
    get :show, recipe_id: @recipe, id: @ingredient
    assert_response :success
  end

  test "should get edit" do
    get :edit, recipe_id: @recipe, id: @ingredient
    assert_response :success
  end

  test "should update ingredient" do
    patch :update, recipe_id: @recipe, id: @ingredient.id, ingredient: { :name => 'dummy', :amount => "1" }
    assert_redirected_to recipe_ingredient_path(assigns(:recipe), assigns(:ingredient) )
  end

  test "should destroy ingredient" do
    assert_difference('Ingredient.count', -1) do
      delete :destroy, id: @ingredient, recipe_id: @recipe
    end

    assert_redirected_to edit_recipe_path(@recipe.id)
  end
end
