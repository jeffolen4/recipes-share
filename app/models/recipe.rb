class Recipe < ActiveRecord::Base
  has_many :comments
  has_many :ingredients
  has_many :recipe_tags

end
