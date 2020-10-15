class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def edit
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.new(params.require(:post).permit(:title, :content, :blogger_id, :destination_id))

        if @post.save
            redirect_to post_path(@post)
        else
            render "new"
        end

    end

    def update
        @post = Post.find(params[:id])
        if @post.update(params.require(:post).permit(:title, :content, :blogger_id, :destination_id, :likes))
            redirect_to post_path(@post)
        else
            render "edit"
        end
    end

    def destroy
    end

end