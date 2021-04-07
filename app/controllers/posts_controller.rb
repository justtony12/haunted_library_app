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
        @post = Post.new(post_params(:title, :description, :author, :genre, :content))
        @post[:title] = params[:post][:title]
        @post[:description] = params[:post][:description]
        @post[:content] = params[:post][:content]
        @post[:genre] = params[:post][:genre]
        @post[:author] = params[:post][:author]
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params(:title, :description, :author, :genre, :content))
        redirect_to post_path(@post)
    end

    private

    def post_params(*args)
        params.require(:post).permit(*args)
    end
end