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
        @user.libraries.build(library_params)
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
        params.require(:library).permit(:book_id, book_attributes: [:title, :author, :id])
    end
end