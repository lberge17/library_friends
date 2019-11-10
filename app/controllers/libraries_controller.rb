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
        # library_params comes through from the book show page and book_params comes through from the library new page
        @book = Book.find_or_create_by(library_params.empty? ? book_params : library_params)
        @user.books << @book if !@user.books.include?(@book)
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

    private

    def set_user
        @user = current_user
    end

    def library_params
        params.require(:library).permit(:book_id)
    end

    def book_params
        params.require(:library).permit(book_attributes: [:title, :author, :id])[:book_attributes]
    end
end