class LibrariesController < ApplicationController
    before_action :set_user
    def index
        @libraries = @user.libraries
    end

    def new
        @library = Library.new
    end

    def create
        @user.libraries.build(book_id: params[:library][:book_id])
        @user.save
        redirect_to libraries_path
    end

    def destroy
        library = Library.find(params[:id])
        if library.user = current_user
            library.destroy
        end
        redirect_to libraries_path
    end

    private

    def set_user
        @user = current_user
    end
end