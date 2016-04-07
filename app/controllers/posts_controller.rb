class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	skip_before_action :authenticate_user!, only: [:index, :show]


	def index
		@posts = policy_scope(Post)
    end

    def show
    	@post = Post.find params[:id]
  	end

  	def new
    	@post = Post.new
    	authorize @post
  	end

  	def create
		@post = current_user.posts.build(post_params)
		authorize @post
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def update
		@post = Post.find(params[:id])
		authorize @post
		if @post.update(post_params)
			redirect_to @post
		else
			render :edit
		end
	end

	def destroy
    	@post.destroy
    	redirect_to :posts
    	authorize @post
  	end

	private
	def set_post
		@post = Post.find(params[:id])
		authorize @post
	end
	def post_params
		params.require(:post).permit(:title, :content, :synopsis, :hashtag, :photo, :photo_cache)
	end
end
