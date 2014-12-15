module Api
  module V1
    class ReservationDatesController < ApplicationController
      respond_to :json
      def price_for_hours
        @reservation_date = Order::ReservationDate.find params[:id]

      end
    end
  end
end