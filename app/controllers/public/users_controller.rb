class Public::UsersController < ApplicationController


  def show
    @user = current_user
    @review = current_user
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
end
