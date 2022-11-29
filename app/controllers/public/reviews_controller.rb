class Public::ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    binding.irb
    @review.user_id = current_user.id
    tag_list = params[:review][:tag_name].split(nil)
    if @review.save
      @review.save_tag(tag_list)
      redirect_to public_reviews_path(@review.id)
    else
      redirect_to public_games_path
    end
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
                                   :review_title, :review_body, content: [])
  end
end


