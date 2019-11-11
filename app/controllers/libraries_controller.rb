class LibrariesController < ApplicationController
    before_action :set_user
    def index
        @libraries = @user.libraries
    end

    def new
        @library = Library.new
        @library.book = Book.new
        @books = Book.all
    end

    def create
        # book_id comes through from the book show page and book_params comes through from the library new page
        if params[:book_id]
            @book = Book.find_by(id: params[:book_id])
        else
            @book = Book.find_or_create_by(book_params)
        end
        # Check to see that book exists and that the user doesn't already have that book in their library.
        @user.books << @book if (@book && !@user.books.include?(@book))
        @user.save
        redirect_to libraries_path
    end

    def destroy
        library = Library.find(params[:id])
        if library.user == current_user
            library.destroy
        end
        redirect_to libraries_path
    end

    def popular_books
        # 5 most popular books in user libraries
        @books = Library.popular_books
    end

    private

    def set_user
        @user = current_user
    end

    def book_params
        params.require(:library).permit(book_attributes: [:title, :author, :id])[:book_attributes]
    end
end