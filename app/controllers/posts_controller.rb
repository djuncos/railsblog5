class PostsController < ApplicationController
	# before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
	    @posts = Post.all
	end

	def show
    	@post = Post.find(params[:id])
  	end

  	def new
	    @post = Post.new
	end

	def create
	    @post = current_user.posts.new(post_params)

	    respond_to do |format|
	      if @post.save
	        format.html { redirect_to @post, notice: 'Post was successfully created.' }
	      else
	        format.html { render :new }
	      end
	    end
	end

	def edit
		@post = Post.find(params[:id])
  	end

	def update
	    @post = Post.find(params[:id])
	    if @post.update_attributes(post_params)
	      flash[:notice] = "Post was successfully updated."
	      redirect_to @post
	    else
	      render 'edit'
	    end
  	end

	def destroy
	    Post.find(params[:id]).destroy
	    flash[:deleted] = "Post was successfully deleted."
	    redirect_to root_url
	end
  


  	private
	    def set_post
	      @post = Post.find(params[:id])
	    end

	    def post_params
	      params.require(:post).permit( :title, :body, :image)
	    end

end
