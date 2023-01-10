class Public::ReviewsController < ApplicationController
    before_action :move_to_signed_in, except: [:index, :show]
  def index
    if params[:tag_id].present? #タグでの検索
      @reviews=Tag.find(params[:tag_id]).reviews.page(params[:page])
    elsif params[:star].present? #評価での検索
      @reviews=Review.where(star: params[:star]).page(params[:page])
    else #検索されていない場合
      @reviews= Review.all.page(params[:page])
    end
  end

  def show
    @review = Review.find(params[:id])
    @game = @review.game
    @post_comment = PostComment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to public_users_my_page_path
    else
      redirect_to edit_public_review_path
    end
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