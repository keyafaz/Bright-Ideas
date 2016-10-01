class LikesController < ApplicationController
	def create
		if Like.where(user_id: current_user, post: Post.find(params[:post_id])).count > 0
			flash[:errors] = ["You already liked this post"]
			redirect_to "/posts"
		else
		@like = Like.create(user:current_user, post: Post.find(params[:post_id]))
		redirect_to '/posts'
		end
	end
end
