class BooksController < ApplicationController
    def index
    end

    def show
    end
    
    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    private

    def book_params
        params.require(:book).permit(:title, :author)
    end
end
