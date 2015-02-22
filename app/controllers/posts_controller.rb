class PostsController <ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post = current_user.posts.build(post_params)    
    if @post.save
      flash[:notice] = "Your post has been published!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your post. Please try again."
      render :new
    end
  end

  private 
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end


