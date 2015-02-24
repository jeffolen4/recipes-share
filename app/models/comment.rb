class Comment < ActiveRecord::Base
  belongs_to :recipe

  validates :comment, presence: true
  # validates :entered_by, presence: true
  # validates :recipe_id, presence: true

end
