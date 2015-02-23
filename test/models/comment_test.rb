require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "do not allow comment with no comment text" do
    recipe = Recipe.first
    comment = Comment.new
    comment.recipe_id = recipe.id
    comment.entered_by = "dummy"
    comment.rating = 1
    assert_not comment.save
  end

  test "do not allow comment without an entered by" do
    recipe = Recipe.first
    comment = Comment.new
    comment.recipe_id = recipe.id
    comment.comment = "dummy comment"
    comment.rating = 1
    assert_not comment.save
  end

  test "do not allow comment without recipe id" do
    comment = Comment.new
    comment.recipe_id = nil
    comment.comment = "dummy comment"
    comment.entered_by = "dummy"
    comment.rating = 1
    assert_not comment.save
  end

  test "allow comment entered with valid fields" do
    recipe = Recipe.first
    comment = Comment.new
    comment.comment = "dummy comment"
    comment.entered_by = "dummy"
    comment.rating = 1
    comment.recipe_id = recipe.id
    assert comment.save
  end

end
