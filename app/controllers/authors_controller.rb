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

    if current_user.authors.include? @author
      @author.update(author_params)
      redirect_to @author
    else
      redirect_to author_path
    end
  end

  def destroy
    @author = Author.find(params[:id]).destroy
    redirect_to '/authors'
  end
    
  private

  def author_params
    params.require(:author).permit(:name, :bio, :post_id, :avatar)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end