class Public::ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to public_reviews_path
  end

  def index
    @review = Review.find(para:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:user_id, :game_id, :star,
                                   :review_title, :review_body, tag_ids: [])
  end
end


