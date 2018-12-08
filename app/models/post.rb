class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, as: :commentable, dependent: :destroy

  default_scope { order(created_at: :desc) }

  paginates_per 8
  mount_uploader :file, FileUploader

  NAME_MAX_SIZE = 42
  CONTENT_MAX_SIZE = 255

  validates :name, presence: true, length: { maximum: NAME_MAX_SIZE }
  validates :content, length: { in: 0..255 }
  validate :format_name
  validate :file_size_validation
  before_save :capitalization_name

  private

  def file_size_validation
    errors[:file] << "should be less than 5MB" if file.size > 2.megabytes
  end
end
