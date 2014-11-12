source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~>4.0.8'

# MongoDB support
gem 'mongoid', '~>4.0.0'
gem 'mongoid-paperclip', require: 'mongoid_paperclip'
gem 'will_paginate_mongoid'

# I18n backend
gem 'redis'
gem 'i18n_dashboard', github: 'fourmach/i18n_dashboard'

gem 'active_model_serializers'

gem 'state_machine'

# Search engine
gem 'ransack', github: 'Zhomart/ransack', branch: 'mongoid'

# Admin tool
gem 'rails_admin'

# Authentication & Authorization
gem 'devise'
gem 'cancancan'

# View handles
gem 'slim-rails'
gem 'html2slim'
gem 'compass-rails'

#ember js
gem 'ember-rails'
gem 'ember-source'
gem 'emblem-rails'
gem 'momentjs-rails'

# For edit translations
gem 'mercury-rails', github: 'jejacks0n/mercury'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 4.2.1'
gem 'jquery-turbolinks'


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'


gem 'gon' # output params from rails -> js

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test, :development do
  gem 'capybara', '~> 2.3.0'
  gem 'rspec-rails', '~> 3.0.0'
  gem 'rspec-mocks'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'cucumber-rails', require: false
  gem 'selenium-webdriver'
  gem 'rack'
  gem 'coveralls', require: false
  gem 'simplecov', require: false
  gem 'unicorn_service', require: false
  gem 'nginx-config', require: false
  gem 'email_spec'
  gem 'delorean'
end

group :development do
  gem 'quiet_assets'
  gem 'capistrano'
  gem 'rvm-capistrano'
  gem 'net-ssh', '~> 2.7.0'
end

group :production do
     nil?
  gem 'unicorn', platform: :ruby
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
