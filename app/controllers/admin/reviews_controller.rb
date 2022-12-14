class Admin::ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
    @user = @review.user
    @game = @review.game
  end
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_root_path
  end

  private
  def review_params
    params.require(:review).permit(:user_id, :game_id, :star, :review_title, :review_body)
  end
end
