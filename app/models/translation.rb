class Translation
  include ActiveModel::Serializable

  EXCEPTED_KEYS = /#{%w(mongoid.errors.messages. number. time. date.formats. support.array errors.messages. ransack.
                    flash. will_paginate. activemodel. views. admin.js. errors.format helpers. admin.loading
                     admin.misc.filter_date_format ).join('|')}/
  @@keys = Set.new
  attr_accessor :key, :original, :value

  def initialize(key, locale)
    @key = key
    @original = I18n.t(key)
    @value = I18n.t(key, locale: locale, default: '')
  end

  def read_attribute_for_serialization(key)
    send key
  end

  def self.all(target_locale)
    result = []
    keys.each {|k| result << Translation.new(k, target_locale)}
    result
  end

  def self.keys
    return @@keys unless @@keys.empty?
    Translation.reset_keys
  end

  def self.reset_keys
    @@keys = Set.new
    I18n.backend.send :init_translations
    I18n.backend.send(:translations).each do |locale, hash|
      hash.flatten_hash.each do |k, v|
        @@keys << k unless EXCEPTED_KEYS === k
      end
    end
    @@keys
  end
end