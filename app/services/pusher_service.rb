module PusherService
  class << self
    def push(comment_attributes)
      PusherCommentWorker.perform_async(comment_attributes.slice(
          *%w(commentable_type commentable_id author created_at content)
      )
      )
    end
  end
end