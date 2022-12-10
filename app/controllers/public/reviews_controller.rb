class Public::ReviewsController < ApplicationController
    before_action :move_to_signed_in, except: [:index, :show]
  def index
    @reviews = Review.all
    @reviews = params[:tag_id].present? ? Tag.find(params[:tag_id]).reviews : Review.all
  end

  def show
    @review = Review.find(params[:id])
    @reviews = Review.all
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    #binding.pry
    @review.user_id = current_user.id
    @review.game_id = params[:review][:game_id]
    tag_lists =  params[:review][:tag_ids]
    tag_lists.shift
    @review.update(review_params)
    #@review.save_tag(item)
    redirect_to public_users_my_page_path
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to public_review_path(review.id)
  end

  private
    def review_params
      params.require(:review).permit(:user_id, :game_id, :star,
                                   :review_title, :review_body, :tag_ids[])
    end
    def move_to_signed_in
        unless user_signed_in?
        redirect_to root_path
        end
    end
end


