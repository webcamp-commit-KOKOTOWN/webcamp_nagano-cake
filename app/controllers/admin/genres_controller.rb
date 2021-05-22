class Admin::GenresController < ApplicationController
    def index
        @genre =Genre.new 
        @genres = Genre.all
    end
    
    def create
        @genre = genre.new(genre_params)
    end
    
    def edit
        @genre = genre.find(params[:id])
    end
    
    def update
    end
    
    private
    
    def genre_params
        params.require(:genre).permit(:name)
    end
    
end
