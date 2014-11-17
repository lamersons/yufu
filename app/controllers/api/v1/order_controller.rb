class Api::V1::OrderController < ApplicationController

  before_action :authenticate_user!, except: :create
  before_action :set_profile,        except: :create

  respond_to :json

  def create
  end

  def update
  end

  def index
    @order = @profile.orders
  end

  def show
    @order = Order::Base.find params[:id]
    respond_with @user
  end

  private
  def set_profile
    @profile = current_user.profiles.find params[:profile_id]
  end
end
