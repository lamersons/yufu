module Api
  module V1
    class OrdersController < ApplicationController

      before_action :authenticate_user!, except: :create
      before_action :set_profile,        except: [:create, :show]
      serialization_scope :current_profile

      respond_to :json

      def create
        @order = build_order order_params
        if @order.save
          respond_with @order, status: :created, location: api_v1_orders_path(@order)
        else
          respond_with @order.errors, status: :unprocessable_entity
        end
      end

      def edit
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
        redirect_to "#{edit_api_v1_order_path(@order)}&profile_id=#{params[:profile_id]}"
      end

      def index
        @orders = scoped_collection.search(params[:q]).result.paginate(per_page: 10, page: params[:page])
        respond_with @orders, serializer: PaginationSerializer
      end

      def show
        @order = Order::Base.find params[:id]
        respond_with @order
      end

      def current_profile
        @profile
      end

      private
        def scoped_collection
          if params[:scope].present? && Order::Base::SCOPES.include?(params[:scope])
            Order::Base.send params[:scope], @profile
          else
            Order::Base.all
          end
        end

        def set_profile
          @profile = current_user.profiles.find params[:profile_id]
        end

        def build_order(options = {})
          params[:order][:_type].constantize.new options
        end

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
                             :native_language_id, :directions_ids, {language_criterions: [:level, :cost, :language_id]},
                            {reservation_dates_attributes: [:date, :hours]}]
                          else
                            []
                    end
          params.require(:order).permit order_params
        end
    end

  end
end