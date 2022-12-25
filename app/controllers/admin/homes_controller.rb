class Admin::HomesController < ApplicationController
  def top
    @reviews = Review.page(params[:page])
  end

    private
  def review_params
    params.require(:review).permit(:user_id, :game_id, :star, :review_title, :review_body)
  end
end
