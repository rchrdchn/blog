class PostController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    render plain: params[:article].inspect
    # @post = Post.new(post_params)

    # @post.save
    # redirect_to @post

    # if @post.save
    #   redirect_to @post
    # else
    #   render 'new'
    # end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
