module Buoys
  class Link
    attr_accessor :text, :options
    attr_reader :current

    def initialize(text, url, options)
      @text, @_url, @options = text, url, options
    end

    def mark_as_current!
      options.deep_merge!(class: 'current')
      @current = true
    end

    def current?
      !!@current
    end

    def url
      @_url || ''
    end

    def url=(str)
      @_url = str
    end
  end
end
