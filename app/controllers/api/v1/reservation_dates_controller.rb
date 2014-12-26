module Api
  module V1
    class ReservationDatesController < ApplicationController
      respond_to :json
      def price_for_hours
        @reservation_date = Order::ReservationDate.find params[:id]

      end

      def index
        order = Order::Verbal.find params[:order_id]
        @reservation_dates = order.reservation_dates
        respond_with @reservation_dates
      end
    end
  end
end