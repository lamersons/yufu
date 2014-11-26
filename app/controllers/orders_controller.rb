class OrdersController < ApplicationController

  before_action :authenticate_user!, except: :create
  before_action :set_profile

  def edit
    @user = current_user
    @directions = Direction.all
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
    redirect_to edit_order_path(@order)
  end

  def set_profile
    @profile = current_user.profiles.where(_type: 'Profile::Client').first
  end

  private

  def order_params
    order_params = [
        {client_info: [:first_name, :last_name, :middle_name]},
        {airport_pick_up: [:need_car, :double_way, :flight_number, :airport, :arriving_date]},
        {car_rent: [:duration, {car: [:name, :cost]}]},
        {hotel: [:greeted_at, :info, :additional_info]},
    ]
    order_params += case params[:order][:_type]
                      when 'Order::Verbal'
                        [:include_near_city, :goal, :translator_sex, :location_id, :translator_native_language_id,
                         :native_language_id, {direction_ids: []}, {language_criterions: [:level, :cost, :language_id]},
                         {reservation_dates_attributes: [:_id, :date, :hours, :_destroy]}]
                      else
                        []
                    end
    params.require(:order).permit order_params
  end

end