class PusherCommentWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'pusher_comment'

  def perform(comment)
    channel = "comments-channel-#{comment['commentable_type'].downcase}-#{comment['commentable_id']}"
    Pusher.trigger(channel, 'new-comment', {
        author: comment['author'],
        created_at: comment['created_at'].to_date.strftime('%b %d, %Y'),
        content: comment['content']
    })
  end
end
