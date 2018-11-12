class Category < ApplicationRecord
  paginates_per 8
  DESCRIPTION_MAX_SIZE = 255

  validates :name, presence: true
  validates :description, length: { in: 0..255 }
  validate :format_name
  before_save :capitalization_name

  private

  def format_name
    arr = name.split(' ').first(2)

    if arr.size < 2
      result = false
    else
      result = arr.all? { |word| word.size >= 2 }
    end
    errors.add(:name, 'Name cant be 2 words and not less 2 chars') unless result
  end

  def capitalization_name
    name.capitalize!
  end
end
