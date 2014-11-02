module Profile
  module Translator
    class Service
      include Mongoid::Document

      field :level
      field :has_hsk,       type: Boolean
      field :verbal_price,  type: Float
      field :written_price, type: Float
      field :written_translate_type

      belongs_to :language
      belongs_to :service_category

      embedded_in :profile_translator_individual
    end
  end
end