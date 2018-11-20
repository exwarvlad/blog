class Comment < ApplicationRecord
  belongs_to :category, polymorphic: true, optional: true
  belongs_to :post, polymorphic: true, optional: true
end
