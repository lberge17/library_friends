class RecommendationsController < ApplicationController
    before_action :set_user

    def index   
        @recommendations = @user.recommendations
    end
    
    def show
        redirect_to user_recommendations_path(@user) if !@recommendation
    end

    def new
        redirect_to new_user_recommandation_path(current_user) if @user != current_user
        @recommendation = Recommendation.new
    end

    def create
    end

    def edit
        redirect_to user_recommendations_path(@user) if !@recommendation
        redirect_to user_recommendation_path(@user, @recommendation) if current_user != @user
    end
    
    def update
    end

    def destroy
    end

    private

    def set_user
        @user = User.find(:user_id)
    end

    def set_recommendation
        @recommendation = @user.recommendations.find_by(id: params[:id])
    end

    def recommendation_params
        params.require(:recommendation).permit(:comment, :user_id, :book_id)
    end

end