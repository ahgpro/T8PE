class PostsController < ApplicationController
	def index
		@posts = Post.all
    end

    def show
    	@post = Post.find params[:id]
  	end

  	def new
    	@post = Post.new
  	end

  	def create
		@post = Post.new post_params
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def destroy
    	@post.destroy
    	redirect_to :back
  	end

	private
	def post_params
		params.require(:post).permit(:title, :content, :synopsis, :hashtag, :photo, :photo_cache)
	end
end
