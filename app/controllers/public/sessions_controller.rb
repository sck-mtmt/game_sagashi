# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   before_action :user_state, only: [:create]

  def user_state
    @user = current_user
    if @user
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_user_session_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end
  def new_guest
    # binding.pry
    user = User.guest
    sign_in user
    redirect_to public_games_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  protected
  def user_state
    @user = current_user
    return if !@user
    if @user.valid_password?(params[:user][:password])
    end
  end
end
