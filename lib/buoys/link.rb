module Buoys
  class Link
    attr_accessor :text, :url, :options
    attr_reader :current

    def initialize(text, url, options)
      @text, @url, @options = text, url, options
    end

    def mark_as_current!
      @current = true
    end

    def current?
      !!@current
    end
  end
end
