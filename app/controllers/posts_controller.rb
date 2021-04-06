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
        @post = Post.create
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
end
