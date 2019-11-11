class RecommendationsController < ApplicationController
    before_action :set_user
    before_action :set_recommendation, only: [:show, :edit, :update, :destroy]

    def index   
        @recommendations = @user.recommendations
    end

    def new
        @recommendation = Recommendation.new
        @books = current_user.alpha_books
        redirect_to new_user_recommandation_path(current_user) if @user != current_user
    end

    def create
        if @user == current_user && !@user.recommended_books.include?(Book.find_by(id: recommendation_params[:book_id]))
            @recommendation = Recommendation.create(recommendation_params)
            @recommendation.user = current_user
            @recommendation.save
        end

        redirect_to user_recommendations_path(current_user)
    end

    def destroy
        @recommendation.destroy if @user == current_user
        redirect_to user_recommendation_path(@user)
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