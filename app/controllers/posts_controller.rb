class PostsController < ApplicationController
  before_action :require_login

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @authors = Author.all
    @genres = Genre.all
  end

  def create
    @authors = Author.all
    @genres = Genre.all
    @post = Post.create(post_params.merge(user_id: current_user.id))

    if @post.valid?
      @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @authors = Author.all
    @genres = Genre.all
  end

  def update
    @post = Post.find(params[:id])
  
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to '/'
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :genre, :content, :author_id, :genre_id, :user_id)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end