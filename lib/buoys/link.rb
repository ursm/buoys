module Buoys
  class Link
    attr_accessor :text, :options
    attr_reader :current

    CONFIG = {
      current_class: (Buoys::Config.current_class || 'current'),
      link_current: (Buoys::Config.link_current || false),
    }.with_indifferent_access

    def initialize(text, url, options)
      @text, @_url, @options = text, url, options.with_indifferent_access
    end

    def mark_as_current!
      options.deep_merge!(class: config[:current_class])
      @current = true
    end

    def current?
      !!@current
    end

    def url
      return '' if current? && !config[:link_current]

      @_url || ''
    end

    def url=(str)
      @_url = str
    end

    private

    def config
      override_options = (options.keys & CONFIG.keys).each_with_object({}) {|key, hash|
        hash[key] = options[key]
      }
      CONFIG.merge(override_options)
    end
  end
end
