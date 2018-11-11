class Category < ApplicationRecord
  paginates_per 8
  DESCRIPTION_MAX_SIZE = 255
end
