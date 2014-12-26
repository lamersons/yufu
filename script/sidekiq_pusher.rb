#! /usr/bin/env ruby
# scripts/sidekiq_pusher.rb
# bundle exec scripts/sidekiq_pusher.rb <Worker's Class>
klass = ARGV[0]
require 'sidekiq'
Sidekiq::Client.push('class' => klass, 'args' => [])