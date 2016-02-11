class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  
  def index
    
  end
  
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success]="Post Saved Successfully"
      redirect_to @post
    else
      flash[:danger]="Post failed to save correctly"
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @post.update post_params
      redirect_to @post, notice: "Article updated"
    else
      render 'edit'
    end
  end
  
  def destroy
   
      redirect_to posts_path
    end
  
  private
  def post_params
    params.require(:post).permit(:title, :content, :slug)
  end
  
  def find_post
    @post = Post.friendly.find(params[:id])
  end
end
