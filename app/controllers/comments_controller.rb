class CommentsController < ApplicationController
	before_action :authenticate_user!
  expose :comment, id: ->{ params[:comment_id] || params[:id] }
 
 # POST  /posts/:post_id/comments
	def create
		post = Post.find_by(params[:post_id])
		@comment = post.comments.build(comment_params)
		@comment.user = current_user
    if @comment.save
      flash[:success] = "comments created successfully."
      redirect_to request.referer
    else
    	flash[:error] = @comment.errors.full_messages
    	redirect_to posts_path
    end
	end

  #GET /posts/:post_id/comments/:id/edit
  def edit
    @comment = comment
  end

  #PATCH  /posts/:post_id/comments/:id
  def update
    comment.update(comment_params)
    redirect_to posts_path
  end

	private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
