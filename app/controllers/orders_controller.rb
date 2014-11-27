class OrdersController < ApplicationController

  before_action :set_profile

  def create
    @order = order_params[:_type].constantize.create
    redirect_to edit_order_path(@order)
  end

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
    if user_signed_in?
      @profile = current_user.profiles.where(_type: 'Profile::Client').first
    end
  end

  private

  def order_params
    order_params = [
        {client_info_attributes: [:first_name, :last_name, :birthday, :company, :country]},
        {airport_pick_up_attributes: [:need_car, :double_way, :flight_number, :airport, :arriving_date]},
        {car_rent_attributes: [:duration, {car: [:name, :cost]}]},
        {hotel_attributes: [:greeted_at, :info, :additional_info]},
        :_type
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