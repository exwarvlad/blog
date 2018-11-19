class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  protected

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
