class GenresController < ApplicationController
  before_action :require_login

  def index
    @genres = Genre.all
  end
    
  def show
    @genre = Genre.find(params[:id])
  end
        
  def new
    @genre = Genre.new
    @posts = Post.all
  end
        
  def create
    @posts = Post.all
    @genre = Genre.new(genre_params.merge(user_id: current_user.id))
    if @genre.save
      redirect_to genre_path(@genre)
    else
      render :new
    end
  end
        
  def edit
    @genre = Genre.find(params[:id])
  end
        
  def update
    @genre = Genre.find(params[:id])

    if current_user.genres.include? @genre
      @genre.update(genre_params)
      redirect_to @genre
    else
      redirect_to genre_path
    end
  end

  def destroy
    @genre = Genre.find(params[:id]).destroy
    redirect_to '/genres'
  end
        
  private
    
  def genre_params
    params.require(:genre).permit(:name, :description, :avatar)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end