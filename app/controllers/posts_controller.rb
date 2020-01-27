class PostsController < ApplicationController
  before_action :authenticate_user!
  expose :post, id: ->{ params[:id] }

  # GET /posts/
  def index
  	public_posts = Post.where(is_public: true)
    user_post = current_user.posts
    @posts =  public_posts + user_post
  end

  # GET /posts/new/
  def new
    @post = Post.new
  end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created successfully."
      redirect_to posts_path
    else
    	flash[:error] = @post.errors.full_messages
    	render 'new'
    end   
  end

  # GET /posts/:id
  def show
  end

  # DELETE /posts/:id
  def destroy
  	post.destroy
  	redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :is_public, :avatar)
  end
end
