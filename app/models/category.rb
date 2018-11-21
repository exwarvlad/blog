class Category < ApplicationRecord
  has_many :posts
  has_many :comments, as: :commentable

  paginates_per 8
  NAME_MAX_SIZE = 255
  DESCRIPTION_MAX_SIZE = 255

  validates :name, presence: true, length: { maximum: NAME_MAX_SIZE }
  validates :description, length: { in: 0..255 }
  validate :format_name
  before_save :capitalization_name
end
