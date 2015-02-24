module FormHelper

  def setup_recipe( recipe )
    # logger.debug "recipe: #{recipe.id}  Name: #{recipe.name}"
    recipe.ingredients.empty? ? [Ingredient.new] : recipe.ingredients
    2.times { recipe.ingredients << Ingredient.new }

    recipe.comments.empty? ? [Comment.new] : recipe.comments
    recipe.comments <<  Comment.new
    
    return recipe
  end

end
