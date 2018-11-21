class Comment < ApplicationRecord
  belongs_to :category, polymorphic: true
  belongs_to :post, polymorphic: true

  MAX_AUTHOR_SIZE = 42
  MAX_CONTENT_SIZE = 255

  validates :author, presence: true, length: { maximum: MAX_AUTHOR_SIZE }
  validates :content, presence: true, length: { maximum: MAX_CONTENT_SIZE }
  validate :format_author
  before_save :capitalization_author

  private

  def format_author
    arr = author.split(' ').first(2)

    if arr.size < 2
      result = false
    else
      result = arr.all? { |word| word.size >= 2 }
    end
    errors.add(:author, 'Name cant be 2 words and not less 2 chars') unless result
  end

  def capitalization_author
    author.capitalize!
  end
end
