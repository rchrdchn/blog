class CommentsController < ApplicationController
    def index
        @comments = Comment.all
    end
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        redirect_to post_path(@post)
    end

    def edit
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end

    def update
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])

        if @comment.update(comment_params)
            redirect_to @post
        else
            render 'edit'
        end
    end
    
    

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
