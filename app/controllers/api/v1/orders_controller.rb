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



      def index
        @orders = Order::Base.search(params[:q]).result.paginate(per_page: 10, page: params[:page])
        respond_with @orders, serializer: PaginationSerializer
      end

      def show
        @order = Order::Base.find params[:id]
        respond_with @order, root: 'order'
      end

      def current_profile
        @profile
      end

      private
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