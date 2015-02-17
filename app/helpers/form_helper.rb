module FormHelper

  def setup_recipe( recipe )
    # logger.debug "recipe: #{recipe.id}  Name: #{recipe.name}"
    recipe.ingredients.empty? ? [Ingredient.new] : recipe.ingredients

    1.times { recipe.ingredients << Ingredient.new }
    return recipe
  end

end
