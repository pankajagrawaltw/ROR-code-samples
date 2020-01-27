class PostNotifyWorker
  include Sidekiq::Worker

  def perform(*args)
  	comment = Comment.find(args)
  	CommentMailer.comment_notify(comment).deliver
  end
end
