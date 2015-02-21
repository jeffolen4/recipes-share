class Recipe < ActiveRecord::Base

  has_many :comments, :dependent => :delete_all
  has_many :ingredients, :dependent => :delete_all
  # has_many :recipe_tags, :dependent => :delete_all


  accepts_nested_attributes_for :comments,
    :allow_destroy => true,
    :reject_if => :all_blank

  accepts_nested_attributes_for :ingredients,
    :allow_destroy => true,
    :reject_if => :all_blank

  # accepts_nested_attributes_for :recipe_tags,
  #   :allow_destroy => true,
  #   :reject_if => :all_blank

end
