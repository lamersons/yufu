module Api
  module V1
    class VerbalTranslationLevelsController < ApplicationController
      respond_to :json
      def index
        @levels = []
        Order::Verbal::TRANSLATION_LEVELS.each do|lvl|
          @levels << {id: lvl, value: t(lvl, scope: 'enums.order/verbal.translation_levels')}
        end
        respond_with verbal_translation_levels: @levels
      end
    end
  end
end
