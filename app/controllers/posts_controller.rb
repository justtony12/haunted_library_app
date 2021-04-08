class PostsController < ApplicationController

  # I want to add this to genres later for my form f.collection_radio_buttons :genre_id, @genre, :id, :name
  # the new post form isn't saving... idk why? https://github.com/crayray/311Now is a reference for what it looks like.
  #https://dev.to/dianakw8591/the-method-in-collectionselect-2no


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
  end

  def create
    @authors = Author.all
    @user = current_user
    @post = Post.new(post_params)

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
  end

  def update
    @post = Post.find(params[:id])
  
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  # def destroy
  #     @post = Post.find(params[:id]).destroy
  #     redirect_to post_path
  # end

  private

  def post_params
    params.permit(:title, :description, :genre, :content, :author_id, :name, :post)
  end

  def require_login
    redirect_to controller: 'welcome', action: 'home' unless session.include? :user_id
  end
end