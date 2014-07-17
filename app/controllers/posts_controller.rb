class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new	
	end

	def edit
		@post = Post.find(params[:id])
	end

	def destroy
		Post.find(params[:id]).destroy
		redirect_to root_path
	end

	def show
		@post = Post.find(params[:id])
	end

	def update
		post = Post.find(params[:id])
		post.assign_attributes(post_params)
		if post.save
			redirect_to root_path
		else
			redirect_to edit_post_path(post.id)
		end
	end

	def create
		post = Post.new(post_params)
		if post.save
			redirect_to post
		else
			redirect_to new_post_path
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :author, :content)
	end
end