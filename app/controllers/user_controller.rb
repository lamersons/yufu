class UserController < ApplicationController
  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.password == params[:old_password]
      @user.update_attributes params[:password]
      redirect_to :root
    else
      redirect_to :back
    end
  end
end
