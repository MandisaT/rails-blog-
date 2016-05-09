class PostsController < ApplicationController
  def show
  	 	@post = Post.find(params[:id])
     
  end

  def new
  	 @post =Post.new
  end

  def index
    @posts =Post.all.order('created_at DESC')
    # this is a collection of post should be saved as pluralized 
    
  end
  def create 
    @post = Post.new(post_params)
	     if @post.save
		      flash[:notice] = "You have succesfully poured out your heart "
		      redirect_to post_path @post
	     else
		flash[:alert] = "Wait you have to write something ! What's on your mind."
		redirect_to new_post_path
	   end
  end 
  def  destroy
    Post.find(params[:id]).destroy
    redirect_to  new_post_path 
  end 
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path @post
  end 
   # def something 
   # @post = Post.find(params[:id])
   # grab by using .update
   # @post.update(post_params) 
   # redirect_to  something
   # end 
  def update
     @post = Post.find(params[:id])
     @post.update(post_params) 
     redirect_to  post_path @post
  end

  private
  def post_params
    params.require(:post).permit(:title ,:body,:user_id).merge(user: current_user)
  end
end 
 

