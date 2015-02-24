class Recipe < ActiveRecord::Base
  has_many :comments, :dependent => :delete_all
  has_many :ingredients, :dependent => :delete_all

  accepts_nested_attributes_for :comments,
    :allow_destroy => true,
    :reject_if => :all_blank

  accepts_nested_attributes_for :ingredients, :reject_if => proc { |attributes| attributes['name'].blank? },
    :allow_destroy => true

  validates :name, presence: true
  validates :directions, presence: true

  # def blank_comment_record(attributed)
  #   logger.debug "comment attributed: #{attributed.inspect}"
  #   attributed.each do |comment|
  #     logger.debug "comment: #{comment.inspect}"
  #     return true if !comment.is_a?(Hash) || comment["comment"].blank?
  #   end
  # end
  #
  # def blank_ingredient_record(attributed)
  #   logger.debug "ingredient attributed: #{attributed.inspect}"
  #   attributed.each do |ingredient|
  #     logger.debug "ingredient: #{ingredient.inspect}"
  #     return true if !ingredient.is_a?(Hash) || ingredient["name"].blank?
  #   end
  # end

end
