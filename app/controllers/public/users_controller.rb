class Public::UsersController < ApplicationController
 before_action :move_to_signed_in, except: [ :show ]

  def create
    item = []
    @review = Review.new
    @review.game_id = params[:review][:game_id]
    tag_lists =  params[:review][:tag_ids]
    tag_lists.shift
    tag_lists.each do |tag_list|
      tag = Tag.find(tag_list)
      item << tag.name
    end
    # binding.pry
    @review.user_id = current_user.id

    if @review.save
      @review.save_tag(item)
      redirect_to public_users_my_page_path
    else
      binding.pry
    end
  end
  def show
    @user = current_user
    @review = current_user.reviews.where(star: nil)
    @reviews = current_user.reviews.where.not(star: nil)
    # @reviews = params[:tag_id].present? ? Tag.find(params[:tag_id]).reviews : Review.all
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
    params.require(:review).permit(:game_id, :tag_ids[],
                                   :star, :review_title, :review_body)
  end
  # def tag_params
  #   params.require(:review).permit(:game_id,:tag_ids[])
  # end
  def move_to_signed_in
      unless user_signed_in?
      redirect_to root_path
      end
  end
end
