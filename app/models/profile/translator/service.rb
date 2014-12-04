module Profile
  module Translator
    class Service
      include Mongoid::Document

      field :level
      field :has_hsk,       type: Mongoid::Boolean
      field :verbal_price,  type: Float
      field :written_price, type: Float
      field :written_translate_type
      field :is_approved,   type: Mongoid::Boolean

      belongs_to :language

      embedded_in :profile_translator_individual

      def name
        "#{language.name} | lvl: #{level}"
      end
    end
  end
end