class AuthorsController < ApplicationController
  before_action :require_login

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end
    
  def new
    @author = Author.new
    @posts = Post.all
  end
    
  def create
    @posts = Post.all
    @author = Author.create(author_params.merge(user_id: current_user.id))
    if @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end
    
  def edit
    @author = Author.find(params[:id])
  end
    
  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to author_path(@author)
    else
      render :edit
    end
  end
    
  private

  def author_params
    params.require(:author).permit(:name, :bio, :post_id)
  end

  def require_login
    redirect_to controller: 'welcome', action: 'home' unless session.include? :user_id
  end
end