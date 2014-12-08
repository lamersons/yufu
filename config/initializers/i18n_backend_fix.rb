module I18n
  module Backend
    class Chain
      def initialized?
        backends.each do |backend|
          return false if !backend.initialized?
        end
        return true
      end

      def translations
        trans = {}
        backends.reverse.each do |backend| # reverse so that the top most will be merged-in
          backend.instance_eval do
            trans.deep_merge!(translations)
          end
        end
        trans
      end

      protected
      def init_translations
        backends.each do |backend|
          backend.instance_eval do
            init_translations
          end
        end
      end
    end
  end
end

module I18n
  module Backend
    class KeyValue
      def initialized?
        true
      end

      protected
      def translations
        trans = {}
        store.keys.delete_if{|k| k.include?("#") || %w(keys system_keys keys_digest).include?(k)}.each do |k|
          trans_pointer = trans
          key_array = k.split(".")
          last_key = key_array.delete_at(key_array.length-1)
          key_array.each do |current|
            unless trans_pointer.has_key?(current.to_sym)
              trans_pointer[current.to_sym] = {}
            end
            trans_pointer = trans_pointer[current.to_sym]
          end
          trans_pointer[last_key.to_sym] = store[k]
        end
        trans
      end

      def init_translations
      end
    end
  end
end