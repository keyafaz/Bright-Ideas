class PostsController < ApplicationController
  def index
  	loggedin?
  	@user=User.find(current_user)
  	@posts = Post.all.sort {|x,y| y.likes.count <=> x.likes.count}
   end

  def show
  	@post = Post.find(params[:id])
  	@likes = Like.where(post_id:params[:id])
  end

  def create
  	@post = Post.new(content:params[:content], user:current_user)
  	if @post.valid?
  		@post.save
  		redirect_to '/posts'
  	else
  		flash[:errors] = @post.errors.full_messages
  		redirect_to '/posts'
  	end  	
  end

  def destroy
  	post=Post.find(params[:id])
  	post.destroy if post.user == current_user
  	redirect_to "/posts"
  end
end
