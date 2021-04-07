class AuthorsController < ApplicationController
    # I need to add and index page for author and finish following along to validations-with-form_tag-rails-lab.
    def show
        @author = Author.find(params[:id])
    end
    
    def new
        @author = Author.new
    end
    
    def create
        @author = Author.new(author_params)
    
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
        params.permit(:name, :bio)
    end
end
