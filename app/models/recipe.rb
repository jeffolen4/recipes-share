class Recipe < ActiveRecord::Base

  has_many :comments
  has_many :ingredients
  has_many :recipe_tags


  accepts_nested_attributes_for :comments,
    :allow_destroy => true,
    :reject_if => :all_blank

  accepts_nested_attributes_for :ingredients,
    :allow_destroy => true,
    :reject_if => :all_blank

  accepts_nested_attributes_for :recipe_tags,
    :allow_destroy => true,
    :reject_if => :all_blank

end
