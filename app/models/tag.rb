class Tag < ActiveRecord::Base
  has_many :recipe_tags
end
