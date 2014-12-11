class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
    @user = current_user
    render layout: 'application'
  end

  def update
    @user = current_user
    if @user.update_attributes user_params
      sign_in @user, bypass: true if @user.need_change_password?
      if session[:back_to_order].nil?
        redirect_to user_path
      else
        session[:back_to_order] = nil
        redirect_to session[:back_to_order]
      end
    else
      render 'users/edit'
    end
  end

  protected
  def user_params
    params.require(:user).permit :password, :password_confirmation
  end

end
