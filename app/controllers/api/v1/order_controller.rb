class Api::V1::OrderController < ApplicationController

  before_action :authenticate_user!

  respond_to :json

  def create
  end

  def update
  end

  def index
  end

  def show
    @order = Order::Base.find params[:id]
    respond_with @user
  end
end
