class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def lookup
        # @users is defined when the search is submitted
        @users = User.search(name: params[:name], email: params[:email]) if params[:name]
    end
end