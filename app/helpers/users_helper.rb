module UsersHelper
    def following_user?(user)
        current_user.following.include?(user)
    end

    def find_follow(user)
        if following_user?(user)
            Follow.find_by(follower_id: current_user.id, following_id: user.id)
        end
    end
end
