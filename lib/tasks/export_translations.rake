namespace :yufu do
  desc 'Export translations from yml to redis'
  task export_translations: :environment do
    I18n.backend.backends.each  do |backend|
      if backend.is_a? I18n::Backend::Simple
        I18n.backend.backends[1].load_translations
        backend.send(:translations).each do |locale, hash|
          hash.flatten_hash.each do |k,v|
            I18nDashboard::Translation.create(k.to_s, v.to_s, locale.to_s) unless I18nDashboard::Translation.exists? k, locale
          end
        end
      end
    end
  end
end