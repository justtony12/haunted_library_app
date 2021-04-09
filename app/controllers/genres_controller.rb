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
  end
        
  def create
    @genre = Genre.new(genre_params)
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
  
    if @genre.update(genre_params)
      redirect_to genre_path(@genre)
    else
      render :edit
    end
  end
        
  private
    
  def genre_params
    params.require(:genre).permit(:name, :description)
  end

  def require_login
    redirect_to controller: 'welcome', action: 'home' unless session.include? :user_id
  end
end