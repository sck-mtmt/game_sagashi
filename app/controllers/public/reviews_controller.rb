class Public::ReviewsController < ApplicationController
    before_action :authenticate_user!

  def index
    @reviews = Review.all
    @reviews = params[:tag_id].present? ? Tag.find(params[:tag_id]).reviews : Review.all
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to public_review_path(@review.id)

  end

  def show
    @review = Review.find(params[:id])
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


