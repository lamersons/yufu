class OrdersController < ApplicationController

  before_action :set_profile
  before_action :filter_params, only: [:update]
  respond_to :json

  def create
    @order = order_params[:_type].constantize.new order_params
    if @order.save!
      redirect_to edit_order_path(@order.id)
    else
      redirect_to :back
    end
  end

  def edit
    @user = current_user
    @directions = Direction.all
    @languages = Language.all
    @order = Order::Base.find params[:id]
    if @order._type == 'Order::Verbal'
      @reservation_dates = @order.reservation_dates.order('date ASC')
    end
    @show_modal = params[:show_modal]
    if @order.step == 3
      session[:back_to_order] = edit_order_path(@order)
      authenticate_user!
    end
    type = /::\S*/.match(@order._type).to_s.underscore
    step = @order.step < 4 ? @order.step : @order.pay_way
    render "/orders#{type}/step_#{step}"
  end

  def update
    @order = Order::Base.find params[:id]
    if @order.update_attributes order_params
      session[:back_to_order] = edit_order_path(@order)
      if @order.step == 3
        authenticate_user!
        @order.set_owner! current_user
      end
      redirect_to edit_order_path(@order)
    else
      type = /::\S*/.match(@order._type).to_s.underscore
      step = @order.step
      render "/orders#{type}/step_#{step}"
    end

  end

  def precount_written_price
    prices = []
    params[:languages].each do |id|
      language = Language.find id
      prices << {name: language.name, price: Price.with_markup(language.written_cost(params[:level]))}
    end
    respond_with prices: prices
  end

  def add_available_languages
    @order = Order::Base.find params[:id]
    if @order.update_attributes available_languages_params
      redirect_to edit_order_path(@order)+'&show_modal=false'
    else
      render 'orders/written/step_1'
    end
  end

  def set_profile
    if user_signed_in?
      @profile = current_user.profiles.where(_type: 'Profile::Client').first
    end
  end

  private

  def order_params
    order_params = [
        {client_info_attributes: [:first_name, :last_name, :birthday, :company, :country]}, :step, :pay_way,
        {airport_pick_up_attributes: [:need_car, :double_way, :flight_number, :airport, :arriving_date]},
        {car_rent_attributes: [:duration, :car_id]},
        {hotel_attributes: [:greeted_at, :info, :additional_info]},
        :_type, :partners_client
    ]
    order_params += case params[:order][:_type]
                      when 'Order::Verbal'
                        [:include_near_city, :goal, :translator_sex, :location_id, :translator_native_language_id,
                         :native_language_id, {direction_ids: []}, {reserve_language_criterions_attributes: [:id, :level, :cost, :language_id]},
                         {main_language_criterion: [:id, :level, :cost, :language_id]},
                         {reservation_dates_attributes: [:_id, :date, :hours, :_destroy, :order_language_criterion_id]}]
                      when 'Order::Written'
                        [:translation_type, :words_number, :level, :translation_type, {translation_language_ids: []},
                         :file, {get_original_attributes: [:type, :name, :address, :index]}, :original_language_id,
                        {get_translation_attributes: [:email, :additional]}, {get_original: [:type, :name, :address, :index]}]
                      else
                        []
                    end
    params.require(:order).permit order_params
  end

  def available_languages_params
    params.require(:order).permit [{available_language_ids: []}, :level]
  end

  def precount_params
    params.permit languages: []
  end

  def filter_params
    if params[:order][:car_rent_attributes]
      if params[:order][:car_rent_attributes][:duration].blank?
        params[:order][:car_rent_attributes].clear
      end
    end
  end

end