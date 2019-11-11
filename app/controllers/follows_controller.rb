class FollowsController < ApplicationController
    def index
        @user = current_user
    end

    def create
        user = User.find_by(id: params[:following_id])
        if !current_user.following.include?(user)
            current_user.following << user
            current_user.save
        end
        redirect_to user_path(user)
    end

    def destroy
        follow = Follow.find_by(id: params[:id])
        follow.destroy if follow
        redirect_to follows_path
    end
end