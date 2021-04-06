class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
    end

    def create
        @post = Post.new(post_params(:title, :description))
        @post[:title] = params[:post][:title]
        @post[:description] = params[:post][:description]
        @post[:content] = params[:post][:content]
        @post[:genre] = params[:post][:genre]
        @post[:rating] = params[:post][:rating]
        @post[:author] = params[:post][:author]
        @post[:date_published] = params[:post][:date_published]
        @post.save
        redirect_to post_path(@post)
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params(:title))
        redirect_to post_path(@post)
    end

    private

    def post_params
        params.require(:post).permit(*args)
    end
end