class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new

  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to public_reviews_path(@review.id)

  end

  def index
    @reviews = Review.all
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
                                   :review_title, :review_body)
  end
end


