namespace :yufu do
  namespace :i18n do
    desc 'Reload translation keys'
    task reset_keys: :environment do
      ::Translation.reset_keys
    end
  end
end