class OrdersController < ApplicationController

  before_action :authenticate_user!, except: :create
  before_action :set_profile

  def edit
    @user = current_user
    @order = Order::Base.find params[:id]
    type = /::\S*/.match(@order._type).to_s.underscore
    step = @order.step
    render "/orders#{type}/step_#{step}"
  end

  def update
    @order = Order::Base.find params[:id]
    if @order.update_attributes order_params
      @order.update_attribute :step, @order.step+1
    end
    redirect_to {edit_order_path(@order)}
  end

  def set_profile
    @profile = current_user.profiles.where(_type: 'Profile::Client').first
  end

end