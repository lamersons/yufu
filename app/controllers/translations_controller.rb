class TranslationsController < ApplicationController

  def update
    keys = params[:content].keys - [:undefined]
    keys.each do |key|
      I18n.backend.store_translations(I18n.locale, {key => params[:content][key][:value]}, escape: false)
    end
    render text: ''
  end
end
