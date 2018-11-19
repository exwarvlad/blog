class Category < ApplicationRecord
  has_many :posts
  paginates_per 8
  DESCRIPTION_MAX_SIZE = 255

  validates :name, presence: true
  validates :description, length: { in: 0..255 }
  validate :format_name
  before_save :capitalization_name
end
