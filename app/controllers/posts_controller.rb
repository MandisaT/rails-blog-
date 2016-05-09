class PostsController < ApplicationController
  def show
  	 	@post = Post.find(params[:id])
     
  end
 
  def edit
    @post = Post.find(params[:id])
  end

  def new
  	  	@post =Post.new
  end

  def index
    @posts =Post.all
    # this is a collection of post should be saved as pluralized 
    
  end
  def create 

  @post = Post.new(body: params[:post][:body],title: params[:post][:title], user_id: current_user.id)
	if @post.save
		flash[:notice] = "You have succesfully poured out your heart "
		redirect_to post_path @post
	else
		flash[:alert] = "Wait you have to write something ! What's on your mind."
		redirect_to new_post_path
	end
  end 
  def  destroy
    @post =Post.find(params[:id]).destroy
    redirect_to  new_post_path 
  end 
  private
  def post_params
  params.require(:post).permit(:title, :body)
 
  end
 # def something 
 # @post = Post.find(params[:id])
 # grab by using .update
 # @post.update(post_params) 
 # redirect_to  something
 # end 
def update
 @post = Post.find(params[:id])
 @post.update(params) 
 redirect_to  post_path @post
 end 
end
