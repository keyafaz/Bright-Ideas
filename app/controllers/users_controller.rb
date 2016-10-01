class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@posts = Post.where(user_id:params[:id])
  	@likes = Like.where(user_id:params[:id])
  end

  def create
    user = User.new(user_params)
    if user.valid?
  		user.save
  		session[:user_id] = user.id
  		redirect_to "/posts"
  	else
  		flash[:errors]= user.errors.full_messages
  		redirect_to "/"
  	end
  end

  private 
  def user_params
  	params.require(:user).permit(:name, :alias,:email, :password, :password_confirmation)
  end

end
