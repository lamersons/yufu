require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Yufu
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.assets.initialize_on_precompile = true

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    locale = :ru
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.available_locales = [:af, :ar, :az, :bg, :bn, :bs, :ca, :cs, :cy, :da, :de, 'de-AT', 'de-CH', :el, :en,
                                     'en-AU', 'en-CA', 'en-GB', 'en-IE', 'en-IN', 'en-NZ', 'en-US', 'en-ZA', :eo, :es,
                                     'es-419', 'es-AR', 'es-CL', 'es-CO', 'es-CR', 'es-EC', 'es-MX', 'es-PA', 'es-PE',
                                     'es-US', 'es-VE', :et, :eu, :fa, :fi, :fr, 'fr-CA', 'fr-CH', :gl, :he, :hi,
                                     'hi-IN', :hr, :hu, :id, :is, :it, 'it-CH', :ja, :km, :kn, :ko, :lo, :lt, :lv, :mk,
                                     :mn, :ms, :nb, :ne, :nl, :nn, :or, :pl, :pt, 'pt-BR', :rm, :ro, :ru, :sk, :sl, :sr,
                                     :sv, :sw, :ta, :th, :tl, :tr, :uk, :ur, :uz, :vi, :wo, 'zh-CN', 'zh-HK', 'zh-TW',
                                     'zh-YUE']
    config.i18n.default_locale = locale
    config.i18n.locale = locale


    config.autoload_paths +=  Dir["#{config.root}/lib/**/"]

    ActionMailer::Base.default from: 'Yufu <noreply.yufu@gmail.com>'

    config.action_mailer.smtp_settings = {
        address:              'smtp.gmail.com',
        port:                  587,
        domain:               'gmail.com',
        user_name:            'noreply.yufu@gmail.com',
        password:             'qwerty7777',
        authentication:       'plain',
        enable_starttls_auto:  true  }

    config.ember.ember_path = "#{Rails.root}/app/assets/javascripts/ember"
    config.handlebars.templates_root = "ember/templates"

  end
end
