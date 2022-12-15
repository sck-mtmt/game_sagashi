class Public::ReviewsController < ApplicationController
    before_action :move_to_signed_in, except: [:index, :show]
  def index
    @reviews = Review.all
    @reviews = params[:tag_id].present? ? Tag.find(params[:tag_id]).reviews : Review.all
  end

  def show
    @review = Review.find(params[:id])
    @game = @review.game
    @reviews = Review.all
    @post_comment = PostComment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to public_users_my_page_path
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to public_users_my_page_path
  end

  private
    def review_params
      params.require(:review).permit(:star, :review_title, :review_body)
    end
    def move_to_signed_in
        unless user_signed_in?
        redirect_to root_path
        end
    end
end


