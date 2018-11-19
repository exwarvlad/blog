class Post < ApplicationRecord
  belongs_to :category
  paginates_per 8

  CONTENT_MAX_SIZE = 255

  validates :name, presence: true
  validates :content, length: { in: 0..255 }
  validate :format_name
  before_save :capitalization_name
end