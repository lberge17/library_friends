class BooksController < ApplicationController
    def index
        if params[:title] || params[:author]
            @books = Book.search(title: params[:title], author: params[:author])
        else
            @books = Book.all
        end
    end

    def show
        @book = Book.find(params[:id])
    end

    private

    def book_params
        params.require(:book).permit(:title, :author)
     end
end
