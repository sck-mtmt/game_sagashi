class Public::UsersController < ApplicationController
 before_action :move_to_signed_in, except: [ :show ]
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to public_users_my_page_path
  end
  def show
    @user = current_user
    @review = current_user.reviews.where(star: nil)
    @reviews = current_user.reviews.where.not(star: nil)
#    @reviews = params[:tag_id].present? ? Tag.find(params[:tag_id]).reviews : Review.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to public_users_my_page_path
  end

  def unsubsscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  private
  def user_params
    params.require(:user).permit(:nick_name, :birth_date, :genger, :email,
                                 :encrypted_password, :is_deleted)
  end
  def review_params
    params.require(:review).permit(:game_id, :tag_ids[])
  end
  def move_to_signed_in
      unless user_signed_in?
      redirect_to root_path
      end
  end
end
