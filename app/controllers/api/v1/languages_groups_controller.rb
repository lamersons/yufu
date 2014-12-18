module Api
  module V1
    class LanguagesGroupsController < ApplicationController
      respond_to :json
      def price
        @language_group = Language.find(params[:language_id]).languages_group
        respond_with price: Price.with_markup(@language_group.verbal_cost(params[:level]))
      end
    end
  end
end