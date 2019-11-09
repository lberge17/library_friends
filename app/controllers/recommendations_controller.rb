class RecommendationsController < ApplicationController
    before_action :set_user

    def index   
        @recommendations = @user.recommendations
    end
    
    def show
        redirect_to user_recommendations_path(@user) if !@recommendation
    end

    def new
        @recommendation = Recommendation.new
        redirect_to new_user_recommandation_path(current_user) if @user != current_user
    end

    def create
        if @user == current_user
            @recommendation.create(recommendation_params)
            @recommendation.user = current_user
            @recommendation_params.save
        end

        redirect_to recommendations_path(current_user)
    end

    def edit
        if !@recommendation
            redirect_to user_recommendations_path(@user)
        elsif current_user != @user
            redirect_to user_recommendation_path(@user, @recommendation)
        end
    end
    
    def update
    end

    def destroy
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end

    def set_recommendation
        @recommendation = @user.recommendations.find_by(id: params[:id])
    end

    def recommendation_params
        params.require(:recommendation).permit(:comment, :book_id)
    end

end