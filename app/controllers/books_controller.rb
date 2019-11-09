class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index
        @books = Book.all
    end

    def show
    end
    
    def new
        @book = Book.new
    end

    def create
        byebug
        # Check if that book title is in the database.
        if existing_titles = Book.where(title: params[:book][:title])
            # Check if any of the matching titles already has that author assigned since 2 different books can have the same title.
            @book = existing_titles.where(author: params[:book][:author])
        else
            @book = Book.create(book_params)
        end
        redirect_to book_path(@book)
    end

    def edit
    end

    def update
        @book.update(book_params)
    end
    
    def destroy
        @book.destroy
    end

    private

    def book_params
        params.require(:book).permit(:title, :author)
    end

    def set_book
        @book = Book.find(params[:id])
    end
end
