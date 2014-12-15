module Api
  module V1
    class LanguagesGroupsController < ApplicationController
      respond_to :json
      def price
        @language_group = Language.find(params[:language_id]).languages_group
        respond_with price: @language_group.verbal_price(params[:level].gsub(/level_/, '').to_i)
      end
    end
  end
end