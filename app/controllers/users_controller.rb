class UsersController < ApplicationController

  def show

  end

  def edit
    if current_user
      @user = current_user
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  def update
    @user = current_user
    if @user.update_attributes user_params
      redirect_to user_path
    else
      render 'users/edit'
    end
  end

  protected
  def user_params
    params.require(:user).permit :password, :password_confirmation
  end

end
